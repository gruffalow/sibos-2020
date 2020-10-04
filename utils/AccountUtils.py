# -*- coding: utf-8 -*-
"""
Created on Wed Sep 23 08:58:19 2020

@author: Alvin Lee

"""
import pandas as pd

class AccountUtils:
    
    def GetAccountNo(self, tempFrame):
            for ind in tempFrame.index:
                 if (str(tempFrame.iloc[ind]) != "nan"):
                     testText = str(tempFrame.iloc[ind])[1:tempFrame.iloc[ind].find("\r\n")]
                     tempFrame.iloc[ind] = testText
            return tempFrame
        
    def GetDebtAccount(self, aFrame, fFrame, kFrame):
        resultFrame =aFrame.copy()
        for ind in aFrame.index:
            if (str(aFrame.iloc[ind]) != "nan"):
                testText = str(aFrame.iloc[ind])[0:aFrame.iloc[ind].find("\r\n")]
                if testText.startswith("/"):
                    testText =testText[1:]
                resultFrame.iloc[ind] = testText
            elif (str(fFrame.iloc[ind]) != "nan"):
                testText = str(fFrame.iloc[ind])[0:fFrame.iloc[ind].find("\r\n")]
                resultFrame.iloc[ind] = testText
            elif (str(kFrame.iloc[ind]) != "nan"):
                testText = str(kFrame.iloc[ind])[0:kFrame.iloc[ind].find("\r\n")]
                if testText.startswith("/"):
                    testText =testText[1:]
                resultFrame.iloc[ind] = testText
        return resultFrame