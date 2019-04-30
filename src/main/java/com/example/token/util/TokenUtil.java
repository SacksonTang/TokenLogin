package com.example.token.util;

import java.security.MessageDigest;
import java.util.UUID;

public class TokenUtil {
    private static final char[] hexcode = "0123456789abcdef".toCharArray();

    public static String createToken() {
        return generateValue(UUID.randomUUID().toString());
    }

    private static String toHexString(byte[] data) {
        if(data == null) {
            return null;
        }
        StringBuilder r = new StringBuilder(data.length * 2);
        for(byte b : data) {
            r.append(hexcode[(b >> 4) & 0xf]);
            r.append(hexcode[(b & 0xf)]);
        }
        return  r.toString();
    }

    private static String generateValue(String param) {
        try {
            MessageDigest algorithm = MessageDigest.getInstance("MD5");
            algorithm.reset();
            algorithm.update(param.getBytes());
            byte[] messageDigest = algorithm.digest();
            return toHexString(messageDigest);
        } catch (Exception e) {
            throw new RuntimeException("Token cannot be generated.", e);
        }
    }
}
