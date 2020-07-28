package com.tqatch.factory.ui.login;

import android.content.Intent;
import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;


import android.util.Patterns;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;


import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.material.textfield.TextInputLayout;
import com.tqatch.factory.MenuActivity;
import com.tqatch.factory.R;

import java.util.Hashtable;
import java.util.Map;

public class LoginActivity extends AppCompatActivity {

    private TextInputLayout user;
    private TextInputLayout password;
    private TextInputLayout company;
    private Toast toast;
    String URL_SERVIDOR="http://192.168.56.1/FACTORY/login.php";

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        //mostrarToastWarnign("Este es un mensaje de alerta");

        user= findViewById(R.id.username);
        password= findViewById(R.id.password);
        company= findViewById(R.id.company);


    }

    public void onClickLogin(View v){
        //if(user.getText().toString().equals("karina.fonseca")) {
          //mostrarToastError("Error usuario/contraseña incorrectos");
        //mostrarToastSuccess("Ha iniciado sesion correctamente");
        //mostrarToastNotification("Esta es una notificacion");
        //mostrarToastWarnign("Este es un mensaje de alerta");
        //loginViewModel.loginDataChanged(user.toString(),password.toString());
        if(validateEmail()&&validatePassword()&&validateCompany()){
            setLogin();
            //validarLogin();
        }else{
            mostrarToastError("Ingrese todos los datos.");
        }


    }

    private void setLogin() {

        Intent i = new Intent(LoginActivity.this, MenuActivity.class);
        startActivity(i);
    }


    private boolean validateEmail(){
        String emailInput=user.getEditText().getText().toString().trim();

        if(emailInput.isEmpty()){
            user.setError("Favor de ingresar este campo.");
            return false;
        }else if(!Patterns.EMAIL_ADDRESS.matcher(emailInput).matches()){
            user.setError("Ingresa un email valido");
            return false;
        }
        else{
            user.setError(null);
            return true;
        }
    }

    private boolean validatePassword(){
        String passwordInput=password.getEditText().getText().toString().trim();

        if(passwordInput.isEmpty()){
            password.setError("Favor de ingresar este campo.");
            return false;
        }else{
            password.setError(null);
            return true;
        }
    }
    private boolean validateCompany(){
        String companyInput=company.getEditText().getText().toString().trim();

        if(companyInput.isEmpty()){
            company.setError("Favor de ingresar  este campo.");
            return false;
        }else{
            company.setError(null);
            return true;
        }
    }

    public void mostrarToastError(String texto){
        LayoutInflater inflater = getLayoutInflater();
        View layout= inflater.inflate(R.layout.custom_toast_error,(ViewGroup)findViewById(R.id.layout_base_toast));
        TextView textView=layout.findViewById(R.id.txt_toast);
        textView.setText(texto);
        if(toast!=null){
            toast.cancel();
            toast=new Toast(getApplicationContext());
        }else{
            toast=new Toast(getApplicationContext());
        }
        toast.setGravity(Gravity.CENTER|Gravity.CENTER,0, 0);
        toast.setDuration(Toast.LENGTH_SHORT);
        toast.setView(layout);
        toast.show();
    }

    public void mostrarToastSuccess(String texto){
        LayoutInflater inflater = getLayoutInflater();
        View layout= inflater.inflate(R.layout.custom_toast_success,(ViewGroup)findViewById(R.id.layout_base_toast));
        TextView textView=layout.findViewById(R.id.txt_toast);
        textView.setText(texto);

        Toast toast=new Toast(getApplicationContext());
        toast.setGravity(Gravity.CENTER|Gravity.CENTER,0, 0);
        toast.setDuration(Toast.LENGTH_SHORT);
        toast.setView(layout);
        toast.show();
    }
    public void mostrarToastWarnign(String texto){

        LayoutInflater inflater = getLayoutInflater();
        View layout= inflater.inflate(R.layout.custom_toast_warning,(ViewGroup)findViewById(R.id.layout_base_toast));
        TextView textView=layout.findViewById(R.id.txt_toast);
        textView.setText(texto);


        if(toast!=null){
            toast.cancel();
            toast=new Toast(getApplicationContext());
        }else{
            toast=new Toast(getApplicationContext());
        }

        toast.setGravity(Gravity.CENTER|Gravity.CENTER,0, 0);
        toast.setDuration(Toast.LENGTH_SHORT);
        toast.setView(layout);
        toast.show();


    }
    public void mostrarToastNotification(String texto){
        LayoutInflater inflater = getLayoutInflater();
        View layout= inflater.inflate(R.layout.custom_toast_notification,(ViewGroup)findViewById(R.id.layout_base_toast));
        TextView textView=layout.findViewById(R.id.txt_toast);
        textView.setText(texto);

        Toast toast=new Toast(getApplicationContext());
        toast.setGravity(Gravity.CENTER|Gravity.CENTER,0, 0);
        toast.setDuration(Toast.LENGTH_SHORT);
        toast.setView(layout);
        toast.show();
    }

    public void validarLogin() {
        StringRequest stringRequest;
        stringRequest = new StringRequest(Request.Method.POST, URL_SERVIDOR,
                new Response.Listener<String>() {

                    @Override
                    public void onResponse(String response) {
                        // En este apartado se programa lo que deseamos hacer en caso de no haber errores

                        if(response.equals("ERROR 1")) {
                            mostrarToastError("Se deben llenar todos los campos");
                        } else if(response.equals("ERROR 2")) {
                            mostrarToastError("Error usuario/contraseña erroneos");
                        } else {
                            setLogin();
                        }

                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(LoginActivity.this, "ERROR AL INICIAR SESION", Toast.LENGTH_LONG).show();
            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                String usernameInput=user.getEditText().getText().toString().trim();
                String passwordInput=password.getEditText().getText().toString().trim();

                // En este metodo se hace el envio de valores de la aplicacion al servidor
                Map<String, String> parametros = new Hashtable<String, String>();
                parametros.put("usuario", usernameInput);
                parametros.put("contrasena", passwordInput);

                return parametros;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(LoginActivity.this);
        requestQueue.add(stringRequest);
    }

}