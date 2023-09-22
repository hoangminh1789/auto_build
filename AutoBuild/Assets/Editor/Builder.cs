using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEditor;

public static class Builder
{
    [MenuItem("Tools/Build")]
    public static void Execute()
    {
        BuilderUtility.GetArg("-buildTarget");
        
        var options = new BuildPlayerOptions();
        options.scenes = EditorBuildSettings.scenes.Where(s => s.enabled).Select(s => s.path).ToArray();
        options.target = GetBuildTarget();
        options.locationPathName = GetOutputPath();
        BuildPipeline.BuildPlayer(options);
    }

    static BuildTarget GetBuildTarget()
    {
        string target = BuilderUtility.GetArg("-buildTarget");

        switch (target)
        {
            case "Android": return BuildTarget.Android;
            case "iOS": return BuildTarget.iOS;
            case "OSX": return BuildTarget.StandaloneOSX;
            case "Win64": return BuildTarget.StandaloneWindows64;
            case "Win32":
            default: return BuildTarget.StandaloneWindows;
        }
    }

    static string GetOutputPath()
    {
        return BuilderUtility.GetArg("-outputPath");
    }
}
