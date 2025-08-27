# Recipe-App
A recipe app developed based on Kandean, with many new features.

The details are as follows.

The slides and reports are listed to help others get a better understanding of the workload and work done with stages.

This project was started in October 2024 and completed in December 2024.

---
# Development Timeline

| Time            | Work to be completed                                                                                                                                     | Comments                                                 |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| ALPHA SUBMISSION| Set up the new basic pages and layout of the digital fridge page on the main page                                                                       | Basic new function setup based on the existing app       |
| BETA SUBMISSION | Add the function of automatically decreasing the quantity of an item in the digital fridge if used in the recipe                                       | Link the digital fridge with the recipe usage            |
| FINAL SUBMISSION| Add an image-recognition API that enables users to scan items to add new items automatically, and add new shopping list pages to auto-create shopping items | Add API and shopping list pages                          |

---

# Brief Overview of the Open-Source App: **Kandean**
<img width="1315" height="642" alt="home (1)" src="https://github.com/user-attachments/assets/7be4c9df-3d5a-4bdb-ae4b-0fa9059874c9" />
<img width="1035" height="671" alt="login" src="https://github.com/user-attachments/assets/525aeb32-01a3-4797-bc56-4df07d5d53eb" />

With the original version of **Kandean** (https://github.com/KEVINGILBERTTODING/Recipe-app.git), users can effortlessly create, post, and share their unique recipes, and comment, like, and save various recipes.

The coming version of this app will also provide a _digital fridge_ that tracks available ingredients. Possible upcoming features include timely reminders for items nearing expiration, automatic updates to the stored quantity of each item, and shopping suggestions when ingredients run low.

While most popular recipe applications focus on creating/sharing recipes or diet planning, **Kandean** uniquely integrates these functionalities with a brand-new digital fridge feature. With this, you can easily manage your diet and shopping choices.

---

# ALPHA SUBMISSION
![digital fridge](https://github.com/user-attachments/assets/7905d266-de47-4bea-af83-1e3328baa85a)
![create   edit](https://github.com/user-attachments/assets/7aaa704a-6308-411e-8298-239443c617cd)
## Newly Implemented Features
- **Digital Fridge Display:** the items in the fridge will be displayed in a scrollable page with a search bar above.
- **A Floating Button:** users can add new item by clicking a floating button on the Digital Fridge page, which provide 2 ways to achieve: write the item and scan the barcode of the item (still developing).
- **Detail Storage View:** allow users to view detailed information about storage items in their digital fridge. Highlight that this page displays item details like name, quantity, unit, category, expiration date, and notes, making it easy for users to manage their stored ingredients.
- **Create Item Functionality:** allow users to add more items to their digital fridge.
- **Edit Item Functionality:** allow users to navigate from the Detail Storage View to an Edit page, where they can update item details.

---

# BETA SUBMISSION
![create](https://github.com/user-attachments/assets/7b3ca264-7ad9-4888-b75a-a68d80e8bb01)
![df](https://github.com/user-attachments/assets/86022265-2bd9-46a8-88ef-e1a4225934f0)
![detail](https://github.com/user-attachments/assets/a57f3b23-0ed0-4081-8635-9f598db1c4fe)

## Newly Implemented Feature: Auto-decreasing Ingredients

Add a function that automatically decreases the quantity of an ingredient in the digital fridge when it is used in a recipe. This is achieved by clicking the **USED** button for the ingredient; it will update the quantity of the item or delete it if used up.

The corresponding changes are made in the following sections.

## Recipe Detail View (fragment_digital_recipe.xml)

- I replaced the original simple text view with a well-formatted `RecyclerView` to show ingredients in a list.
- Each item uses `item_ingredient.xml` and contains a **USED** button beside it.
- Clicking **USED** decreases the corresponding ingredient's current quantity.

To handle potential unit incompatibilities (e.g., "g" vs. "kg"), we compare and unify units using the `getConversionFactor` function in the `IngredientAdapter` class.

There are several cases for auto-decreasing:
- **Sufficient stock**: only the item's quantity is updated.
- **Equal to current stock**: the item is deleted.
- **Insufficient stock**: the system uses the available quantity first, then searches for more of the ingredient and performs the update again.

This logic is managed by the `processItemUpdate` function in the `IngredientAdapter` class.

## Create Recipe Functionality (CreateRecipeFragment, fragment_create_recipe.xml)

- Ensures recipe creators specify the quantity and unit for each ingredient.
- Each ingredient must be entered in a row containing name, quantity, and unit.
- Units can only be selected from provided options. To add more ingredients, click the add button.
- A text hint is provided for guidance below this section.
- The outdated image selection, upload, and encoding algorithm has been replaced with a current algorithm.

## Edit Recipe Functionality

- Nearly the same as the create recipe part (same UI and validation for ingredient name, quantity, unit).

---

# FINAL SUBMISSION
![微信图片_20241220025744](https://github.com/user-attachments/assets/d9e8a843-7758-4dad-bd95-1bdda676396e)

## Newly Implemented Feature: Storage Category Filter

In the Digital Fridge Display page, a category tab is added under the search bar. Users can click different category tabs to display corresponding items.


## AI-supported Image Recognition

- Implemented a scan-item function using image-recognition to automatically add new items to the digital fridge.
- This is implemented using the Baidu image recognition interface. The highest-scoring result is used as the recognition result.
- Usage: Click the “scan item” floating button, choose an image of the ingredient, and the app can add that ingredient automatically.
- Implemented in: `DigitalFridgeFragment`, `InterfaceBaidu`, `BaiduResultBean`, `GetDiscernResultResponse`. (Slides map classes to functions.)



## Add Shopping List Pages

Added a shopping list feature that supports handwriting or scanning an item’s image to add new items.

Pages and components:
- **Main View Page:** A shopping list button is added on the digital fridge page. Click it to view all items in your shopping list. Layout: `fragment_shopping_list.xml`. Main logic: `ShoppingListFragment`.
- **Add New Item:** Accessible from the shopping list page via a handwriting button or a scan button (same as digital fridge). Layout: `fragment_create_shopping_item.xml`. Logic: `CreateShoppingItemFragment`.
- **Delete Item:** Delete an item by clicking the red trash icon on the right-hand side of the item. Implemented in `AllShoppingAdapter` in the view page.



## Auto-create A New Item If Needed

- When an ingredient in the digital fridge is insufficient while using a recipe, the app can automatically create a new item in the shopping list.
- Behavior: If stock is not sufficient when clicking **USED**, the app redirects to the create-shopping-item page and auto-fills the form to create the shopping-list item.
- Implemented by adding logic under the “ingredient not sufficient” case in `IngredientAdapter` that translates to the shopping list pages.


