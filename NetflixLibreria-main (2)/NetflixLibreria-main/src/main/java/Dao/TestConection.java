package Dao;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;


public class TestConection {
    public static void main(String[] args) {
        String uri = "mongodb+srv://alexs:root@cluster0.ujl8fuq.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

        try(MongoClient mongoClient = MongoClients.create(uri)) {
            MongoDatabase database = mongoClient.getDatabase("NetflixLibreria");
            MongoCollection<Document> collection = database.getCollection("Usuario");

            Document doc = collection.find().first();

            if(doc != null) {
                System.out.println(doc.toJson());
            }else{
                System.out.println("No se encontro el usuario");
            }

        }
    }
}
