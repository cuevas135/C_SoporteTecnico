﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

/// <summary>
/// Descripción breve de Reniec
/// </summary>
public class Reniec
{
    #region Variables
    private string _Nombres;
    private string _ApePaterno;
    private string _ApeMaterno;
    private string _Dni;
    private Resul state;
    private CookieContainer myCookie;
    #endregion

    #region Constructor
    public Reniec()
    {
        try
        {
            myCookie = null;
            myCookie = new CookieContainer();
            ServicePointManager.Expect100Continue = true;
            //ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3;
            //SE CAMBIO ESTA LINEA EL DIA 19-08-2017
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls;
            ReadCapcha();
        }
        catch (Exception ex)
        {
            throw ex;
            //__mensaje = "";
        }
    }
    #endregion

    #region Propiedades
    public enum Resul
    {
        Ok = 0,
        NoResul = 1,
        ErrorCapcha = 2,
        Error = 3,
    }
    public Image GetCapcha
    {
        get { return ReadCapcha(); }
    }
    public string Dni
    {
        get { return _Dni; }
    }
    public string Nombres
    {
        get { return _Nombres; }
    }
    public string ApePaterno
    {
        get { return _ApePaterno; }
    }
    public string ApeMaterno
    {
        get { return _ApeMaterno; }
    }
    public Resul GetResul
    {
        get { return state; }
    }
    #endregion

    #region Metodos

    private Boolean ValidarCertificado(object sender, System.Security.Cryptography.X509Certificates.X509Certificate certificate, System.Security.Cryptography.X509Certificates.X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors)
    {
        return true;
    }
    private Image ReadCapcha()
    {
        try
        {
            //posiblemente aca este el error
            System.Net.ServicePointManager.ServerCertificateValidationCallback = new System.Net.Security.RemoteCertificateValidationCallback(ValidarCertificado);
            HttpWebRequest myWebRequest = (HttpWebRequest)WebRequest.Create("https://cel.reniec.gob.pe/valreg/codigo.do");
            myWebRequest.CookieContainer = myCookie;
            myWebRequest.Proxy = null;
            myWebRequest.Credentials = CredentialCache.DefaultCredentials;
            HttpWebResponse myWebResponse = (HttpWebResponse)myWebRequest.GetResponse();
            Stream myImgStream = myWebResponse.GetResponseStream();
            return Image.FromStream(myImgStream);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void GetInfo(string numDni, string ImgCapcha)
    {
        try
        {
            string myUrl = string.Format("https://cel.reniec.gob.pe/valreg/valreg.do?accion=buscar&nuDni={0}&imagen={1}", numDni, ImgCapcha);
            HttpWebRequest myWebRequest = (HttpWebRequest)WebRequest.Create(myUrl);
            myWebRequest.UserAgent = "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0";//esto creo que lo puse por gusto :/
            myWebRequest.CookieContainer = myCookie;
            myWebRequest.Credentials = CredentialCache.DefaultCredentials;
            myWebRequest.Proxy = null;
            HttpWebResponse myHttpWebResponse = (HttpWebResponse)myWebRequest.GetResponse();
            Stream myStream = myHttpWebResponse.GetResponseStream();
            StreamReader myStreamReader = new StreamReader(myStream);
            string _WebSource = HttpUtility.HtmlDecode(myStreamReader.ReadToEnd());
            string[] _split = _WebSource.Split(new char[] { '<', '>', '\n', '\r' });
            List<string> _resul = new List<string>();
            for (int i = 0; i < _split.Length; i++)
            {
                if (!string.IsNullOrEmpty(_split[i].Trim()))
                    _resul.Add(_split[i].Trim());
            }
            switch (_resul.Count)
            {
                case 217:
                    state = Resul.ErrorCapcha;
                    break;
                case 232:
                    state = Resul.Ok;
                    break;
                case 222:
                    state = Resul.NoResul;
                    break;
                default:
                    state = Resul.Error;
                    break;
            }
            if (state == Resul.Ok)
            {
                _Dni = numDni;
                _Nombres = _resul[185];
                _ApePaterno = _resul[186];
                _ApeMaterno = _resul[187];
            }
            myHttpWebResponse.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void ShowMessage(System.Web.UI.WebControls.HiddenField __mensaje, System.Web.UI.WebControls.HiddenField __pagina, string msg, string paginaweb)
    {
        __mensaje.Value = msg;
        __pagina.Value = paginaweb;
    }
    #endregion
}