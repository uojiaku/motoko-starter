import Types "Types";
import Buffer "mo:base/Buffer";
import Result "mo:base/Result";
import Nat "mo:base/Nat";

actor {
    public type Homework = Types.Homework;

    let homeworkDiary = Buffer.Buffer<Homework>(0);  // Define a variable called homeworkDiary that will be used to store the homework tasks. 
                                                    // Use a suitable data structure (such as Buffer or Array) for this variable.

    public func addHomework(homework: Homework) : async Nat {  // Implement addHomework, which accepts a homework of type Homework, 
                                                               // adds the homework to the homeworkDiary, and returns the id of the homework. 
                                                               // The id should correspond to the index of the homework in homeworkDiary.
        let index = homeworkDiary.size();
        homeworkDiary.add(homework);
        return index;
    };

    public func markAsComplete(homeworkId : Nat) : async Result.Result<(),Text> {
        let homeworkOpt : ?Homework = homeworkDiary.getOpt(homeworkId);
        switch(homeworkOpt) {
            case(null) {
                return #err("Homework not found with the id : " # Nat.toText(homeworkId));
            };
            case(? homework) {
                let newHomework = {
                    title = homework.title;
                    description = homework.description;
                    dueDate = homework.dueDate;
                    completed = true;
                };
                homeworkDiary.put(homeworkId, newHomework);
                return #ok()
            };
        };
    };

    public shared func markAsCompleted(id : Nat) : async Result.Result<(), Text> {
        if (id >= homeworkDiary.size()) {
            return #err("Invalid Id");
        };

       // var homework : Homework = homeworkDiary.get(id);                            // old version
          let homework : Homework = homeworkDiary.get(id);                             // new version
       // homework.completed := true;  // ERROR: expected mutable assignment target?  // old version
        let newHomework = {                                                             // new version
            title = homework.title;                                                     //      |
            description = homework.description;                                         //      |
            dueDate = homework.dueDate;                                                 //      |
            completed = true;                                                           //      |
        };                                                                              //      v
        homeworkDiary.put(id, newHomework);                                             // new version
        return #ok();
        
    };

    };

   
                                                                            // Implement markAsComplete, which accepts a homeworkId of type Nat 
                                                                           // and updates the completed field of the corresponding homework to true, 
                                                                           // and returns a unit value wrapped in an Ok result. 
                                                                           // If the homeworkId is invalid, 
                                                                           //    the function should return an error message wrapped in an Err result.
}


// when we deploy the canister, then fill in the fields in candid UI. We then record the info with the id 0
// we can check the id in the markAsComplete section. if we use a number that doesn't exist we get 'homework not found' 