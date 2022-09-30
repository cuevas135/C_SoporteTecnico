using System.IO;
using System.Net;
using System.Text;
using System.Web.Script.Serialization;

/// <summary>
/// Descripción breve de CsSignal
/// </summary>
public class CsSignal
{
    public CsSignal()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072; //TLS 1.2
    //ServicePointManager.SecurityProtocol = (SecurityProtocolType)768; //TLS 1.1


    public void EnviarNotificacionAdministrador()
    {
        //ENVIA NOTIFICACION SOLO A LOS ADMINISTRADORES
        //SE DEBE AGREGAR ID DE USUARIOS QUE SE GENERA, ESTO SE DEBE VER EN PAGINA DE ONE SIGNAL
        ServicePointManager.SecurityProtocol = (SecurityProtocolType)768 | (SecurityProtocolType)3072;
        var request = WebRequest.Create("https://onesignal.com/api/v1/notifications") as HttpWebRequest;

        request.KeepAlive = true;
        request.Method = "POST";
        request.ContentType = "application/json; charset=utf-8";
        string mensaje = "Su solicitud ha sido visualizada y asignada a un tecnico en breve se comunicara con usted.";
        var serializer = new JavaScriptSerializer();
        var obj = new
        {
            app_id = "21b967f4-0513-4f69-ad17-5999947de053",
            contents = new { en = mensaje },
            include_player_ids = new string[] {
                "2f322f2c-1acb-4a20-a48e-626b9abed80c",
                "be58970c-8056-4691-a444-426e1401adf4",
                "fb8ace16-923e-492c-9ef2-b07cac34789e" //RICARDO GUZMAN
                }
        };


        var param = serializer.Serialize(obj);
        byte[] byteArray = Encoding.UTF8.GetBytes(param);
        string responseContent = null;

        try
        {
            using (var writer = request.GetRequestStream())
            {
                writer.Write(byteArray, 0, byteArray.Length);
            }

            using (var response = request.GetResponse() as HttpWebResponse)
            {
                using (var reader = new StreamReader(response.GetResponseStream()))
                {
                    responseContent = reader.ReadToEnd();
                }
            }
        }
        catch (WebException ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.Message.ToString());
            System.Diagnostics.Debug.WriteLine(new StreamReader(ex.Response.GetResponseStream()).ReadToEnd());
        }

        System.Diagnostics.Debug.WriteLine(responseContent);
    }

    public void EnviarNotificacionTodos()
    {
        //ENVIA NOTIFICACION A TODOS LAS PERSONAS QUE TENGAN INSTALADA LA APLICACION
        ServicePointManager.SecurityProtocol = (SecurityProtocolType)768 | (SecurityProtocolType)3072;
        var request = WebRequest.Create("https://onesignal.com/api/v1/notifications") as HttpWebRequest;


        request.KeepAlive = true;
        request.Method = "POST";
        request.ContentType = "application/json; charset=utf-8";

        request.Headers.Add("authorization", "Basic OTdjM2VhMzItZTNiNi00MTEwLWI0NzktM2ZiYzdhOTRhZjVl");

        string mensaje = "mensaje de prueba";

        var serializer = new JavaScriptSerializer();
        var obj = new
        {
            app_id = "21b967f4-0513-4f69-ad17-5999947de053",
            contents = new { en = mensaje },
            included_segments = new string[] { "Subscribed Users" }
        };
        var param = serializer.Serialize(obj);
        byte[] byteArray = Encoding.UTF8.GetBytes(param);

        string responseContent = null;

        try
        {
            using (var writer = request.GetRequestStream())
            {
                writer.Write(byteArray, 0, byteArray.Length);
            }

            using (var response = request.GetResponse() as HttpWebResponse)
            {
                using (var reader = new StreamReader(response.GetResponseStream()))
                {
                    responseContent = reader.ReadToEnd();
                }
            }
        }
        catch (WebException ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.Message);
            System.Diagnostics.Debug.WriteLine(new StreamReader(ex.Response.GetResponseStream()).ReadToEnd());
        }

        System.Diagnostics.Debug.WriteLine(responseContent);
    }
}