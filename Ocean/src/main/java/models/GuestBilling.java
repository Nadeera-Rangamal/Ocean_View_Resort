package models;

public class GuestBilling {

    private String reservation_no;
    private String guest_name;
    private String room_no;
    private String check_in;
    private String check_out;
    private int num_nights;
    private double room_rate;
    private double room_charges;
    private double additional_charges;
    private double tax;
    private double total_amount;
    private String payment_method;

    // Getters and Setters

    public String getReservation_no() { return reservation_no; }
    public void setReservation_no(String reservation_no) { this.reservation_no = reservation_no; }

    public String getGuest_name() { return guest_name; }
    public void setGuest_name(String guest_name) { this.guest_name = guest_name; }

    public String getRoom_no() { return room_no; }
    public void setRoom_no(String room_no) { this.room_no = room_no; }

    public String getCheck_in() { return check_in; }
    public void setCheck_in(String check_in) { this.check_in = check_in; }

    public String getCheck_out() { return check_out; }
    public void setCheck_out(String check_out) { this.check_out = check_out; }

    public int getNum_nights() { return num_nights; }
    public void setNum_nights(int num_nights) { this.num_nights = num_nights; }

    public double getRoom_rate() { return room_rate; }
    public void setRoom_rate(double room_rate) { this.room_rate = room_rate; }

    public double getRoom_charges() { return room_charges; }
    public void setRoom_charges(double room_charges) { this.room_charges = room_charges; }

    public double getAdditional_charges() { return additional_charges; }
    public void setAdditional_charges(double additional_charges) { this.additional_charges = additional_charges; }

    public double getTax() { return tax; }
    public void setTax(double tax) { this.tax = tax; }

    public double getTotal_amount() { return total_amount; }
    public void setTotal_amount(double total_amount) { this.total_amount = total_amount; }

    public String getPayment_method() { return payment_method; }
    public void setPayment_method(String payment_method) { this.payment_method = payment_method; }
}
