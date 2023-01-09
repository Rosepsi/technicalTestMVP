# technicalTestMVP
### El ejercicio consiste en la implementación de una sencilla aplicación móvil que presente por pantalla información de las transacciones de una cuenta bancaria obtenidas de un servicio web en formato JSON. La prueba debe ser escrita en Swift para iOS o Kotlin para Android.

## Notas:
1. Las transacciones no están ordenadas por fecha.
2.  El campo ‘amount’ indica un gasto (valor negativo) o un ingreso (valor positivo).
3. El campo ‘fee’ indica una comisión a aplicar sobre el gasto o ingreso.
4.  Algunos campos pueden tener valor vacío, nulo o no existir.
5. Los campos ‘amount’ y ‘fee’ se suponen en euros.

## Requisitos:
1. Mostrar en la parte superior de la pantalla la última transacción ocurrida.
2. Mostrar debajo el resto de transacciones ordenadas por fecha.
3. Mostrar el total de cada transacción teniendo en cuenta la comisión.
4. Mostrar un distintivo verde en los ingresos y rojo en los gastos.
5. No mostrar transacciones con formato de fecha inválido.
6. En caso de transacciones con el mismo id se deberá mostrar la más reciente.
