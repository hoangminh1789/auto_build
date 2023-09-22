using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BuilderUtility
{
    public static string GetArg(string key)
    {
        var args = Environment.GetCommandLineArgs();
        int idx = Array.LastIndexOf(args, key);
        
        if (idx >= 0 && idx < args.Length - 1)
        {
            return args[idx + 1];
        }

        return "";
    }
}
