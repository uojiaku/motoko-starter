import Time "mo:base/Time";
actor {
    type Time = Time.Time;
    type Homework = {
        title : Text;
        description: Text;
        dueDate : Time;
        completed : Bool;
    };
}