# TRPS Guesty API - Booking Management

This document provides implementation details for the **Booking History API** and **Cancel Booking API** in the TRPS Guesty system.

---

## Base URL

```
https://trps-guesty-api-etbyfbdvcvabcgfp.eastasia-01.azurewebsites.net/api/v1
```

---

## Authentication
Both APIs require **Bearer Token** authentication.

**Authorization Header:**
```
Authorization: Bearer <JWT_TOKEN>
```
Replace `<JWT_TOKEN>` with a valid token.

---

## 1. Booking History API

### Endpoint
```
GET /booking/history
```

### Description
Retrieves the booking history for a given `tenant_id`, `guesty_id`, and `user_email`.

### Request Parameters
| Name         | Type   | Required | Description                              |
|--------------|--------|----------|------------------------------------------|
| tenant_id    | string | No      | Tenant ID associated with the user       |
| guesty_id    | string | No      | Guesty ID associated with the user       |
| user_email   | string | No      | Email address of the user (URL-encoded)  |

- **Note:** All three parameters are required for best results. `user_email` must be URL-encoded (e.g., `sohanur@scalebridger.com`).

---

### Example Request (cURL)
```bash
curl --location 'https://trps-guesty-api-etbyfbdvcvabcgfp.eastasia-01.azurewebsites.net/api/v1/booking/history?tenant_id=198&guesty_id=6899bd079ed800079b71d276&user_email=sohanur%40scalebridger.com' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer <JWT_TOKEN>'
```

### Example Request (JavaScript fetch)
```js
const response = await fetch('https://trps-guesty-api-etbyfbdvcvabcgfp.eastasia-01.azurewebsites.net/api/v1/booking/history?tenant_id=198&guesty_id=6899bd079ed800079b71d276&user_email=sohanur%40scalebridger.com', {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer <JWT_TOKEN>'
  }
});
const data = await response.json();
console.log(data);
```

---

### Example Response
```json
{
  "success": true,
  "message": "Booking history retrieved successfully",
  "data": {
    "bookings": [
      {
        "_id": "689c56af66b31b128a9e869f",
        "booking_id": "BKTRPS20250813151106ERp8u",
        "guest_name": "Test booking (Sohan)",
        "check_in_date": "2025-10-05T00:00:00.000Z",
        "check_out_date": "2025-10-08T00:00:00.000Z",
        "total_amount": 1125.99,
        "currency": "AED",
        "booking_status": "pending",
        "booking_payment_status": "pending"
      }
    ],
    "total": 3,
    "totalPages": 1,
    "currentPage": 1
  },
  "user_context": {
    "user_id": "198",
    "guesty_id": "6899bd079ed800079b71d276",
    "email": "sohanur@scalebridger.com"
  }
}
```

---

## 2. Cancel Booking API

### Endpoint
```
POST /booking/cancel-booking
```

### Description
Cancels a booking using the `reservation_id`.

### Request Body
| Name           | Type   | Required | Description                     |
| -------------- | ------ | -------- | ------------------------------- |
| reservation_id | string | Yes      | Unique reservation ID to cancel |

---

### Example Request (cURL)
```bash
curl --location 'https://trps-guesty-api-etbyfbdvcvabcgfp.eastasia-01.azurewebsites.net/api/v1/booking/cancel-booking' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer <JWT_TOKEN>' \
--data '{
    "reservation_id": "689c56ada5b3550011065aa8"
}'
```

### Example Request (JavaScript fetch)
```js
const response = await fetch('https://trps-guesty-api-etbyfbdvcvabcgfp.eastasia-01.azurewebsites.net/api/v1/booking/cancel-booking', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer <JWT_TOKEN>'
  },
  body: JSON.stringify({ reservation_id: '689c56ada5b3550011065aa8' })
});
const data = await response.json();
console.log(data);
```

---

### Example Response
```json
{
  "success": true,
  "message": "Booking cancelled successfully",
  "data": {
    "reservation_id": "689c56ada5b3550011065aa8",
    "status": "cancelled"
  }
}
```

---

## Notes

- **Booking Status Values:**
    - `pending` – Awaiting confirmation or payment
    - `confirmed` – Booking is confirmed
    - `cancelled` – Booking has been cancelled

- **Payment Status Values:**
    - `pending` – Payment not completed
    - `paid` – Payment successful
    - `failed` – Payment failed

- Make sure `user_email` in the **Booking History API** is URL-encoded.

---

## Changelog

- **2025-08-13:** Added `booking/history` and `booking/cancel-booking` endpoints.

---

## Quick Reference: JavaScript fetch() Usage

### Booking History Example
```js
const url = 'https://trps-guesty-api-etbyfbdvcvabcgfp.eastasia-01.azurewebsites.net/api/v1/booking/history?tenant_id=198&guesty_id=6899bd079ed800079b71d276&user_email=sohanur%40scalebridger.com';
const response = await fetch(url, {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer <JWT_TOKEN>'
  }
});
const data = await response.json();
console.log(data);
```

### Cancel Booking Example
```js
const url = 'https://trps-guesty-api-etbyfbdvcvabcgfp.eastasia-01.azurewebsites.net/api/v1/booking/cancel-booking';
const response = await fetch(url, {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer <JWT_TOKEN>'
  },
  body: JSON.stringify({ reservation_id: '689c56ada5b3550011065aa8' })
});
const data = await response.json();
console.log(data);
```
