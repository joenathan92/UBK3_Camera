package com.dedykuncoro.uploadimage;

import android.app.ProgressDialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;
//import android.provider.Settings;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.dedykuncoro.uploadimage.app.AppController;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import java.io.File;

public class MainActivity extends AppCompatActivity
{
    Button buttonChoose;
    Button buttonTakePicture;
    FloatingActionButton buttonUpload;
    Toolbar toolbar;
    ImageView imageView;
    EditText txt_nik;
    EditText txt_description;
    Bitmap bitmap, decoded;
    int success;
    int PICK_IMAGE_REQUEST = 1;
    int REQUEST_IMAGE_CAPTURE = 2;
    int bitmap_size = 97; // range 1 - 100

    private static final String TAG = MainActivity.class.getSimpleName();

    private static String APP_DIRECTORY = "MyPictureApp/";
    private static String MEDIA_DIRECTORY = APP_DIRECTORY + "UBK3-Gallery";

    /* 10.0.2.2 adalah IP Address localhost Emulator Android Studio. Ganti IP Address tersebut dengan
    IP Address Laptop jika di RUN di HP/Genymotion. HP/Genymotion dan Laptop harus 1 jaringan! */
//    private String UPLOAD_URL = "http://192.168.156.2/android/upload_image/upload.php";  //IP localhost 1
    private String UPLOAD_URL = "http://192.168.113.178/android/upload_image/upload.php";  //IP localhost 2
    //private String UPLOAD_URL = "http://192.168.14.229/ubk3/android/upload_image/upload.php";   //IP server

    private static final String TAG_SUCCESS = "success";
    private static final String TAG_MESSAGE = "message";
    private String KEY_IMAGE = "image";
    private String KEY_NIK = "nik";
    private String KEY_DESCRIPTION = "description";

    private String mPath;

    String tag_json_obj = "json_obj_req";

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        buttonChoose = (Button) findViewById(R.id.buttonChoose);
        buttonTakePicture = (Button)findViewById(R.id.buttonTakePicture);
        buttonUpload = (FloatingActionButton) findViewById(R.id.buttonUpload);

        txt_nik = (EditText) findViewById(R.id.editText);

        txt_description = (EditText) findViewById(R.id.editText1);

        imageView = (ImageView) findViewById(R.id.imageView);

        buttonChoose.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                showFileChooser();
            }
        });

        buttonTakePicture.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                showTakePicture();
            }
        });

        buttonUpload.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                uploadImage();
            }
        });
    }

    public String getStringImage(Bitmap bmp)
    {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        bmp.compress(Bitmap.CompressFormat.PNG, bitmap_size, baos);
        byte[] imageBytes = baos.toByteArray();
        return Base64.encodeToString(imageBytes, Base64.DEFAULT);
    }

    @SuppressWarnings("deprecation")
    private void uploadImage()
    {
        //menampilkan progress dialog
        final ProgressDialog loading = ProgressDialog.show(this, "Uploading...", "Please wait...", true, false);
        StringRequest stringRequest = new StringRequest(Request.Method.POST, UPLOAD_URL, new Response.Listener<String>()
                {
                    @Override
                    public void onResponse(String response)
                    {
                        Log.e(TAG, "Response: " + response);

                        try {
                            JSONObject jObj;
                            jObj = new JSONObject(response);
                            success = jObj.getInt(TAG_SUCCESS);

                            if (success == 1)
                            {
                                Log.e("v Add", jObj.toString());

                                Toast.makeText(MainActivity.this, jObj.getString(TAG_MESSAGE), Toast.LENGTH_LONG).show();

                                kosong();

                            }
                            else
                            {
                                Toast.makeText(MainActivity.this, jObj.getString(TAG_MESSAGE), Toast.LENGTH_LONG).show();
                            }
                        }
                        catch (JSONException e)
                        {
                            e.printStackTrace();
                        }
                        //menghilangkan progress dialog
                        loading.dismiss();
                    }
                },
                new Response.ErrorListener()
                {
                    @Override
                    public void onErrorResponse(VolleyError error)
                    {
                        //menghilangkan progress dialog
                        loading.dismiss();

                        //menampilkan toast
                        Toast.makeText(MainActivity.this, error.getMessage(), Toast.LENGTH_LONG).show();
                        Log.e(TAG, error.getMessage());
                    }
                })
        {
            @Override
            protected Map<String, String> getParams()
            {
                //membuat parameters
                Map<String, String> params = new HashMap<>();

                //menambah parameter yang di kirim ke web servis
                params.put(KEY_IMAGE, getStringImage(decoded));
                params.put(KEY_NIK, txt_nik.getText().toString().trim());
                params.put(KEY_DESCRIPTION, txt_description.getText().toString().trim());

                //kembali ke parameters
                Log.e(TAG, "" + params);
                return params;
            }
        };

        AppController.getInstance().addToRequestQueue(stringRequest, tag_json_obj);
    }

    private void showFileChooser()
    {
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction(Intent.ACTION_GET_CONTENT);
        startActivityForResult(Intent.createChooser(intent, "Select Picture"), PICK_IMAGE_REQUEST);
    }
    private void showTakePicture()
    {
        //Intent intent = new Intent(android.provider.MediaStore.ACTION_IMAGE_CAPTURE);
        //startActivityForResult(Intent.createChooser(intent, "Take Picture"), REQUEST_IMAGE_CAPTURE);
        File file = new File(Environment.getExternalStorageDirectory(), MEDIA_DIRECTORY );
        boolean isDirectoryCreated = file.exists();

        if(!isDirectoryCreated)
            isDirectoryCreated = file.mkdirs();

        if(isDirectoryCreated)
        {
            Long timestamp = System.currentTimeMillis() / 1000;
            String imageName = timestamp.toString() + ".png";

            mPath = Environment.getExternalStorageDirectory() + File.separator + MEDIA_DIRECTORY + File.separator + imageName;

            File newFile = new File(mPath);

            Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
            intent.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(newFile));
            startActivityForResult(intent, REQUEST_IMAGE_CAPTURE);
        }
    }

    @Override
    public void onSaveInstanceState(Bundle outState)
    {
        super.onSaveInstanceState(outState);
        outState.putString("file_path", mPath);
    }

    @Override
    protected void onRestoreInstanceState(Bundle savedInstanceState)
    {
        super.onRestoreInstanceState(savedInstanceState);
        mPath = savedInstanceState.getString("file_path");
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data)
    {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == PICK_IMAGE_REQUEST && resultCode == RESULT_OK && data != null && data.getData() != null)
        {
            Uri filePath = data.getData();
            try
            {
                //mengambil gambar dari Gallery
                bitmap = MediaStore.Images.Media.getBitmap(getContentResolver(), filePath);
                //imageView.setImageBitmap(bitmap);
                // 512 adalah resolusi tertinggi setelah image di resize, bisa di ganti.
                //setToImageView(getResizedBitmap(bitmap, 1024));
                setToImageView(getResizedBitmap(bitmap, 512));
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
        if (requestCode == REQUEST_IMAGE_CAPTURE && resultCode == RESULT_OK)
        {
            /*assert data != null;
            bitmap = (Bitmap) data.getExtras().get("data");
            setToImageView(getResizedBitmap(bitmap, 1024));
            setToImageView(getResizedBitmap(bitmap, 512));
            imageView.setImageBitmap(bitmap);*/

            MediaScannerConnection.scanFile(this, new String[]{mPath}, null,
                    new MediaScannerConnection.OnScanCompletedListener()
                    {
                        @Override
                        public void onScanCompleted(String path, Uri uri)
                        {
                            Log.i("ExternalStorage", "Scanned " + path + ":");
                            Log.i("ExternalStorage", "-> Uri = " + uri);
                        }
                    });

            Bitmap bitmap = BitmapFactory.decodeFile(mPath);
            setToImageView(getResizedBitmap(bitmap, 512));
            //setToImageView(getResizedBitmap(bitmap, 1024));
            //imageView.setImageBitmap(bitmap);

        }
    }

    private void kosong()
    {
        imageView.setImageResource(0);
        txt_nik.setText(null);
        txt_description.setText(null);
    }

    private void setToImageView(Bitmap bmp)
    {
        //compress image
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        bmp.compress(Bitmap.CompressFormat.PNG, bitmap_size, bytes);
        decoded = BitmapFactory.decodeStream(new ByteArrayInputStream(bytes.toByteArray()));

        //menampilkan gambar yang dipilih dari camera/gallery ke ImageView
        imageView.setImageBitmap(decoded);

    }

    // function to resize image
    public Bitmap getResizedBitmap(Bitmap image, int maxSize)
    {
        int width = image.getWidth();
        int height = image.getHeight();

        float bitmapRatio = (float) width / (float) height;
        if (bitmapRatio > 1)
        {
            width = maxSize;
            height = (int) (width / bitmapRatio);
        }
        else
        {
            height = maxSize;
            width = (int) (height * bitmapRatio);
        }
        return Bitmap.createScaledBitmap(image, width, height, true);
    }

}