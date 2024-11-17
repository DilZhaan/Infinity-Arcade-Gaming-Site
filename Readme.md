# Infinity Arcade 🎮  

Infinity Arcade is an online gaming platform developed as part of our Y2S1 academic project. The platform supports various features such as user management, review management, inquiry management, and dynamic functionalities based on user roles (Player and Admin).  

## Project Overview  
This project utilizes:  
- **Backend:** Java Servlets  
- **Frontend:** JSP, Bootstrap, JavaScript  
- **Server:** Apache Tomcat 10.1  
- **Development Environment:** Eclipse  

## Key Features  
1. **User Management:**  
   - Add, edit, delete, and manage users with role-specific access (Player or Admin).  
   - Seamless user registration and authentication processes.  

2. **Review Management:**  
   - Allows users to add, view, edit, and delete reviews for games.  
   - Integrated with the game pages for a better user experience.  

3. **Inquiry Management:**  
   - Enables users to submit inquiries through a contact form.  
   - Admins can view, respond to, and manage inquiries.  

4. **Dynamic Page Rendering:**  
   - Players see options like downloads and shopping carts.  
   - Admins have access to admin-specific controls for efficient management.  

5. **Image Upload Feature:**  
   - Users and admins can upload and manage images dynamically, with proper file handling on the server side.  

## Team Contributions  
- **Nethmi Niwarthana:** Review Management  
  Managed the functionality for adding, viewing, editing, and deleting reviews on the platform, ensuring an intuitive user experience.  

- **Randula Kumari:** Inquiry Management  
  Developed the inquiry form submission and management system, enabling users to communicate effectively with the platform admins.  

- **Thanushi Nethsarani:** User Management  
  Implemented user account creation, editing, and deletion features, ensuring proper role-based access and management.  

- **DilZhan Yapa:** Game Management  
  Developed dynamic pages for the Game Store, Product Details, and Home. Implemented logic to differentiate functionalities for Players and Admins. Created the image upload feature for efficient file handling.  

## Project Initialization  
### Prerequisites  
- **Eclipse IDE**  
- **Apache Tomcat 10.1** (configured in Eclipse)  
- **Java JDK** (version compatible with Servlets and JSP)  

### Steps to Run the Project  
1. **Clone the Repository:**  
   Clone this repository to your local system using Git or download it as a ZIP file.  

2. **Create the Project in Eclipse:**  
   - Open Eclipse.  
   - Create a new **Dynamic Web Project**.  
   - Copy the project files (src, WebContent, etc.) into the created project folder.  

3. **Configure Apache Server:**  
   - Go to the **Servers** tab in Eclipse.  
   - Add **Apache Tomcat 10.1** and link it to your project.  

4. **Run the Project:**  
   - Right-click on the project and select **Run As → Run on Server**.  
   - The application will start on `http://localhost:8080/<project-name>`.  

### Troubleshooting  
- If Eclipse crashes or the application fails to load, try restarting the server and cleaning the project build.  
- For consistent deployment, consider creating a **Docker container** for this project in the future.  

## Future Enhancements  
- Implementing Docker containerization for easier deployment and scalability.  
- Adding more advanced features, such as analytics dashboards and AI-based game recommendations.  

## License  
This project is developed for academic purposes and is not licensed for commercial use.