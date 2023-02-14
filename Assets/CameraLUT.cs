using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraLUT : MonoBehaviour
{
    //public Shader awesomeShader = null;
    public Material green;
    public Material desert;
    public Material m_renderMaterial;
    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, m_renderMaterial);
    }
    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            m_renderMaterial = green;
        }
        if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            m_renderMaterial = desert;
        }
    }

}
