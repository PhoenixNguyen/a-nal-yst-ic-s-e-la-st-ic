package vn.onepay.vietokenizer.service.impl;

import java.util.ArrayList;
import java.util.List;

import vn.hus.nlp.tokenizer.VietTokenizer;
import vn.onepay.dev.constant.DevCommonConstant;
import vn.onepay.vietokenizer.service.VietokenService;

public class VietokenServiceImpl implements VietokenService {
    private static VietTokenizer tokenizer = new VietTokenizer(DevCommonConstant.PATH_VIETOKENIZER_PROPERTIES);
    
    @Override
    public String tokenizeToString(String str) {
        String[] token = tokenizer.tokenize(str);
        String resultStr = "";
        for(int i = 0; i < token.length; i++) {
            if(i != token.length - 1) resultStr += token[i] + " " + " ";
            else resultStr += token[i];
        }
        return resultStr;
    }

    @Override
    public List<String> tokenizeToListKey(String str) {
        String[] key = tokenizeToString(str).split(" ");
        List<String> result = new ArrayList<String>();
        result.add(str);
        for(int i = 0; i < key.length; i++) {
            if(!result.contains(key[i]))
            result.add(key[i].replaceAll("_", " "));
        }
        return result;
    }
}
