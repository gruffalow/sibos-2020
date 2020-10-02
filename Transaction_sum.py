# -*- coding: utf-8 -*-
"""
Created on Fri Oct  2 15:02:55 2020

@author: Homepc
"""

import pymysql
import pandas as pd
from utils.api_fx import APIConverter


connection = pymysql.connect(host='34.87.0.48',
                              user='alvin',
                              password='Password1!',
                              db='findata')

try:
    apifx = APIConverter();
    
    query = "select concat(52A,':',debtacc) as account, 32A_currency as ccy, total from (select 52A, debtacc, 32A_currency, sum(32A_amount) total from findata.messages where sender = 52A and type = '103' group by 52A, debtacc, 32A_currency order by total desc limit 100) debit "
    
    debitDf = pd.read_sql(query, connection)
    
    query = "select concat(57A,':',beneacc) as account, 32A_currency as ccy, total from (select 57A, beneacc, 32A_currency, sum(32A_amount) total from findata.messages where receiver = 57A and type = '103' group by 57A, beneacc, 32A_currency order by total desc limit 100) credit "
    
    creditDf = pd.read_sql(query, connection)
    
    column_names = ['account', 'debit', 'credit']
    overallDf = pd.DataFrame(columns=column_names)
    
    for ind in debitDf.index:
        amount = 0
        if debitDf['ccy'].iloc[ind] != "USD":
            amount = apifx.performUSDFX(debitDf['ccy'].iloc[ind], debitDf['total'].iloc[ind])
            print ("Before Conversion " + debitDf['ccy'].iloc[ind] + str(debitDf['total'].iloc[ind]) + " After USD" + str(amount))
        else:
            amount = debitDf['total'].iloc[ind]
        
        #missing check if the account already exists in column and to update the value instead of adding new row
        new_row = [debitDf['account'].iloc[ind], amount, 0]
        overallDf = overallDf.append(pd.Series(new_row, index=overallDf.columns), ignore_index=True)


    for ind in creditDf.index:
        amount = 0
        if creditDf['ccy'].iloc[ind] != "USD":
            amount = apifx.performUSDFX(creditDf['ccy'].iloc[ind], creditDf['total'].iloc[ind])
            print ("Before Conversion " + creditDf['ccy'].iloc[ind] + str(creditDf['total'].iloc[ind]) + " After USD" + str(amount))
        else:
            amount = creditDf['total'].iloc[ind]
        

finally:

    connection.close()