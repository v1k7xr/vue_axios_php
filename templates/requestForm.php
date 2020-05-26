
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 d-flex justify-content-center">
            <div class="wrapper" id="app">
            <div class="requestform" v-if="!sended">
                <h3 class="text-center"> Форма обратной связи </h3>
                    <div class="validationError">
                        <p v-if="errors.length">
                            <b>Пожалуйста, исправьте следующие ошибки и попробуйте отправить заявку ещё раз:</b>
                            <ul>
                                <li v-for="error in errors">{{ error }}</li>
                            </ul>
                        </p>
                    </div>
                    <form
                    @submit="saveData"
                    method="post"> 
                        <label for="inputName">Ваше имя</label>
                        <input type="text" class="form-control inputclass" id="inputName"  placeholder="Введите имя" v-bind:style="{ 'border-color': colorMassive[0] }" v-model='name'>
                            <br>
                        <label for="inputEmail">Email адрес</label>
                        <input type="email" class="form-control inputclass" id="inputEmail" aria-describedby="emailHelp" placeholder="Введите email" v-bind:style="{ 'border-color': colorMassive[1] }" v-model='email'>
                            <br>
                        <label for="inputPhoneNumber">Укажите Ваш номер телефона для связи</label>
                        <input type="tel" class="form-control inputclass" id="inputPhoneNumber" placeholder="89991117755" pattern="[0-9]{11}" v-bind:style="{ 'border-color': colorMassive[2] }" v-model='phoneNumber' required>
                        <small id="phoneNumberHelp" class="form-text">Пример номера телефона: 89991117751 (обязательно 11 цифр)</small>
                            <br> <br>
                        <label for="commentTextarea">Комментарий</label>
                        <textarea class="form-control inputclass" id="commentTextarea" rows="5" v-bind:style="{ 'border-color': colorMassive[3] }" v-model='commentary'></textarea>
                            <br>
                        <button type="submit" value="Submit" class="btn btn-secondary btn-lg btn-block myButton" @click='saveData()'>Отправить заявку</button>
                    </form>
            </div>
            <div v-else class="requestform">
                <template v-if="status"> 
                    <h3 class="text-center"> Заявка была отправлена. </h3>
                    <p> Имя отправителя: {{ name }} </p>
                    <p> E-mail: {{ email }} </p>
                    <p> Телефон: {{ phoneNumber }} </p>
                    <p> С Вами свяжутся после {{ managerConnTime }} </p>
                </template>
                <template v-else> 
                    <h3 class="text-center"> Заявка с этого email была отправлена ранее. </h3>
                    <h3 class="text-center"> Повторно заявку можно будет отправить {{ afterHourConnectTime }} </h3>
                </template>
            </div>
            </div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>