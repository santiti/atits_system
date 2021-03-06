﻿<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        Dim p As System.Reflection.PropertyInfo = GetType(System.Web.HttpRuntime).GetProperty("FileChangesMonitor", System.Reflection.BindingFlags.NonPublic Or System.Reflection.BindingFlags.[Public] Or System.Reflection.BindingFlags.[Static])

        Dim o As Object = p.GetValue(Nothing, Nothing)

        Dim f As System.Reflection.FieldInfo = o.[GetType]().GetField("_dirMonSubdirs", System.Reflection.BindingFlags.Instance Or System.Reflection.BindingFlags.NonPublic Or System.Reflection.BindingFlags.IgnoreCase)

        Dim monitor As Object = f.GetValue(o)

        Dim m As System.Reflection.MethodInfo = monitor.[GetType]().GetMethod("StopMonitoring", System.Reflection.BindingFlags.Instance Or System.Reflection.BindingFlags.NonPublic)
        m.Invoke(monitor, New Object() {})

    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
       
</script>