import java.util.ArrayList;
import java.util.List;

import model.Categori;

public class test11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
      Categori categori = new Categori();
      categori.categorySetting(3);
      
    List<Categori> childCategories = new ArrayList<>();
    childCategories = categori.getChildCategories();
    for (Categori category : childCategories) {
        System.out.println("Category ID: " + category.getId());
        System.out.println("Category Name: " + category.getName());
        System.out.println("Parent Category ID: " + category.getParent_category_id());
        System.out.println("Created At: " + category.getCreated_at());
        System.out.println("Updated At: " + category.getUpdated_at());
        System.out.println("Deleted At: " + category.getDeleted_at());
        System.out.println();
    }
      
      
      
//      System.out.println(categori.getName());
//      List<Categori> descendantCategories = categori.getParentCategories();
//      System.out.println(descendantCategories);
//      for (Categori category : descendantCategories) {
//          System.out.println("Category ID: " + category.getId());
//          System.out.println("Category Name: " + category.getName());
//          System.out.println("Parent Category ID: " + category.getParent_category_id());
//          System.out.println("Created At: " + category.getCreated_at());
//          System.out.println("Updated At: " + category.getUpdated_at());
//          System.out.println("Deleted At: " + category.getDeleted_at());
//          System.out.println();
//      }
//      
//      
//      
//      System.out.println("================================");
//      List<Categori> parentCategories = new ArrayList<>();
//     
//   parentCategories = categori.getParentCategories();
//   for (Categori category : parentCategories) {
//       System.out.println("Category ID: " + category.getId());
//       System.out.println("Category Name: " + category.getName());
//       System.out.println("Parent Category ID: " + category.getParent_category_id());
//       System.out.println("Created At: " + category.getCreated_at());
//       System.out.println("Updated At: " + category.getUpdated_at());
//       System.out.println("Deleted At: " + category.getDeleted_at());
//       System.out.println();
//   }
//   
//   
//   System.out.println("================================");
//   
//   List<Categori> childCategories = new ArrayList<>();
//   childCategories = categori.getChildCategories();
//   for (Categori category : childCategories) {
//       System.out.println("Category ID: " + category.getId());
//       System.out.println("Category Name: " + category.getName());
//       System.out.println("Parent Category ID: " + category.getParent_category_id());
//       System.out.println("Created At: " + category.getCreated_at());
//       System.out.println("Updated At: " + category.getUpdated_at());
//       System.out.println("Deleted At: " + category.getDeleted_at());
//       System.out.println();
//   }
//   
 
   
   
	}

}
