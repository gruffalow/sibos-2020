# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 07:29:04 2020

@author: Alvin
"""

import requests
import json

class APIConverter:

    url = "https://currencyscoop.p.rapidapi.com/latest"

    headers = {
        'x-rapidapi-host': "currencyscoop.p.rapidapi.com",
        'x-rapidapi-key': "05fa14b944msh24fa30fa77a37a9p12d26ajsn5a7ea8acdf1a"
        }

    response = requests.request("GET", url, headers=headers)

    
    fx_dict = json.loads(response.text)
    
    def performUSDFX(self, ccy, amount):
        """
        

        Parameters
        ----------
        ccy : text
            transaction currency.
        amount : double
            amount to be converted.

        Returns
        -------
        TYPE
            amount converted to USD.

        """
        amount = amount / self.fx_dict['response']['rates'][str(ccy)]
        return round(amount, 2)