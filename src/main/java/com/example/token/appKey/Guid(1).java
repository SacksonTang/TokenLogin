package com.example.token.appKey;

import java.util.UUID;

public class Guid {
    public String app_key;

    public String guid() {
        UUID uuid = UUID.randomUUID();
        String key = uuid.toString();
        return key;
    }

    public String App_key() {
        Guid g = new Guid();
        String guid = g.guid();
        app_key = guid;
        return app_key;
    }

    public static void main(String[] args) {
        Guid gd = new Guid();
        String app_key = gd.App_key();
        System.out.println("app_key:  " + app_key);
    }

}

