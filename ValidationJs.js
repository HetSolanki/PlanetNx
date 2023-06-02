function required1(obj, str, errorid) {
    if (obj.value == "") {
        document.getElementById(errorid).innerHTML = str;
        obj.style.borderColor = "red";
        document.getElementById(errorid).style.color = "red";
        obj.focus();
    }
    else {
        document.getElementById(errorid).innerHTML = "";
        obj.style.borderColor = "black";
    }
}




function validate(obj, type, errorid) {
    var phoneno = /^\d{10}$/;
    var email = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/;

    if (type == "Phone") {
        if (obj.value.match(phoneno)) {
            document.getElementById(errorid).innerHTML = "";
            obj.style.borderColor = "black";
            return true;
        } else {
            document.getElementById(errorid).innerHTML = "Enter Valid Phone Number";
            obj.style.borderColor = "red";
            document.getElementById(errorid).style.color = "red";
            obj.focus();
        }
    }else if (type == "email") {
        if (obj.value.match(phoneno)) {
            document.getElementById(errorid).innerHTML = "";
            obj.style.borderColor = "black";
            return true;
        } else {
            document.getElementById(errorid).innerHTML = "Enter Valid Phone Number";
            obj.style.borderColor = "red";
            document.getElementById(errorid).style.color = "red";
            obj.focus();
        }
    }
}

