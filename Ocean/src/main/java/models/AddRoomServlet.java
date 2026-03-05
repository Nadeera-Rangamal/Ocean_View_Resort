package models;

public class AddRoomServlet {

    private String roomNumber;
    private String roomType;
    private double price;
    private String description;
    private String imageName;

    public AddRoomServlet() {}

    public AddRoomServlet(String roomNumber, String roomType, double price,
                          String description, String imageName) {
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.price = price;
        this.description = description;
        this.imageName = imageName;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public String getRoomType() {
        return roomType;
    }

    public double getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public String getImageName() {
        return imageName;
    }
}
