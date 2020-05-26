window.addEventListener('load', function() {
    const app = new Vue({
        el: '#app',
        data: {
            errors: [],
            name: "",
            email: "",
            phoneNumber: "",
            commentary: "",
            sended: false,
            status: '',
            managerConnTime: '',
            afterHourConnectTime: '',

            elColor: 'black',
            colorMassive: [
                'black',
                'black',
                'black',
                'black',
            ],
            errC: [],
        },
        methods: {
            changeColor: async function() {
                this.elColor = 'red';
                this.errC.forEach((errIndex) => {
                    this.colorMassive[errIndex] = 'red';
                })
            },
            validationCheck: function() {
                var fieldsFullVal = this.onEmptyFieldCheck();
                var emailVal = this.emailCheck(this.email)
                var phoneNumberVal = this.phoneCheck(this.phoneNumber);
                var nameVal = this.nameCheck(this.name);

                if (!fieldsFullVal) {
                    this.errors.push('Все поля должны быть заполнены.');
                    this.errC.push(3);
                }

                if (!emailVal) {
                    this.errors.push('Некорректный email.');
                    this.errC.push(1);
                }

                if (!phoneNumberVal) {
                    this.errors.push('Некорректный номер телефона.');
                    this.errC.push(2);
                }

                if (!nameVal) {
                    this.errors.push('Имя содержит недопустимые символы (разрешены только символы алфавита).');
                    this.errC.push(0);
                }

            },
            emailCheck: function(email) {
                var re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(email);
            },
            phoneCheck: function(phoneNumber) {
                var re = /^8[0-9]{10}/;
                return re.test(phoneNumber);
            },
            nameCheck: function(name) {
                var re = /^[^<>!@{}#$[\]%^&*();',.\/\\?~"0-9]+$/;
                return re.test(name);
            },
            onEmptyFieldCheck: function() {
                if (this.email.length < 5 || this.name.length < 5 || this.phoneNumber.length < 11 || this.commentary.length == 5) {
                    return false;
                }
                return true;
            },
            saveData: async function(e) {
                this.errors = [];
                this.errC.forEach((errIndex) => {
                    this.colorMassive[errIndex] = 'black';
                })
                this.errC = [];
                this.validationCheck();
                this.changeColor();
                if (this.errors.length > 0) {
                    return;
                } else {

                    this.sended = true;
                    
                    var sendData = {
                        name: this.name,
                        email: this.email,
                        phoneNumber: this.phoneNumber,
                        commentary: this.commentary,
                    };

                    let axiosConfig = {
                        headers: {
                            'Content-Type': 'application/json;charset=UTF-8',
                            "Access-Control-Allow-Origin": "*",
                        }
                    };

                    console.log(sendData);

                    await axios.post('api/action.php', sendData, axiosConfig)
                    .then((response) => {
                        console.log(response);
                        if (response.data.status === 'ok') {
                            this.status = true;
                        } else {
                            this.status = false;
                        }
                        this.managerConnTime = response.data.mct;
                    }).catch((error) => {
                        console.log(error);
                    });

                    //ЧЧ:ММ:СС ДД.ММ.ГГГГ
                    var _time = new Date(this.managerConnTime + " UTC");
                    var ahct = new Date(this.managerConnTime + " UTC");
                    var month = ("0" + (_time.getMonth() + 1)).slice(-2);
                    var mct = `${_time.getHours()}:${_time.getMinutes()}:${_time.getSeconds()} ${_time.getDate()}.${month}.${_time.getFullYear()}`;
                    this.managerConnTime = mct;
                    console.log(ahct);
                    ahct.setMinutes( ahct.getMinutes() - 30 );
                    mct = `${ahct.getHours()}:${ahct.getMinutes()}:${ahct.getSeconds()} ${ahct.getDate()}.${month}.${ahct.getFullYear()}`;
                    this.afterHourConnectTime = mct;
                }
            }
        }
    })
})