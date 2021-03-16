#if UNITY_EDITOR
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using GameApplication;
using GameFramework.Runtime;
using Newtonsoft.Json;
using UnityEditor;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityGameFramework.Runtime;
using Object = UnityEngine.Object;

public class FuTest : MonoBehaviour
{
    public GraphicRaycaster m_Raycaster;
    public PointerEventData m_PointerEventData;
    public EventSystem m_EventSystem;
    // Start is called before the first frame update
    void Start()
    {
        ES3Settings settings = ES3Settings.defaultSettings;
        Debug.Log(settings.path);
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            Debug.Log(ES3.Load<int>("11111111"));
        }
        else if(Input.GetKeyDown(KeyCode.Alpha2))
        {
            // foreach (var VARIABLE in ES3.GetKeys())
            // {
            //     Debug.Log(ES3.Load("1"));
            //     Debug.Log(ES3.Load("2"));
            // }
            // ES3Settings settings = ES3Settings.defaultSettings;
            // ES3.DeleteFile();
        }

        // Input.touches
        //Check if the left Mouse button is clicked
        // if (Input.GetKeyDown(KeyCode.Mouse0))
        // {
        //     //Set up the new Pointer Event
        //     m_PointerEventData = new PointerEventData(m_EventSystem);
        //     //Set the Pointer Event Position to that of the mouse position
        //     m_PointerEventData.position = Input.mousePosition;
        //
        //     //Create a list of Raycast Results
        //     List<RaycastResult> results = new List<RaycastResult>();
        //
        //     //Raycast using the Graphics Raycaster and mouse click position
        //     m_Raycaster.Raycast(m_PointerEventData, results);
        //
        //     //For every result returned, output the name of the GameObject on the Canvas hit by the Ray
        //     foreach (RaycastResult result in results)
        //     {
        //         Debug.Log("Hit " + result.gameObject.name);
        //     }
        // }
    }
    
    
    [ContextMenu("TEST")]
    private void Test()
    {
    }
}
#endif
