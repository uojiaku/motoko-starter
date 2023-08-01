import Time "mo:base/Time";
module {
  public type Time = Time.Time;
  public type Homework = {
    title : Text;
    description : Text;
    dueDate : Time;
    completed : Bool;
  };
};

// Define a record type Homework that represents a homework task. 
// A Homework has a title field of type Text, a description field of type Text, a dueDate field of type Time, and a completed field of type Bool.