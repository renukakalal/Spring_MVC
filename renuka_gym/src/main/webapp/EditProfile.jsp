<%@ page isELIgnored="false" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User Details | Gym Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e9f2 100%);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .form-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .form-header h2 {
            color: #2d3436;
            font-size: 2em;
            margin-bottom: 10px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        label {
            color: #4a5568;
            margin-bottom: 8px;
            font-size: 0.95em;
            font-weight: 500;
        }

        input {
            padding: 12px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 1em;
            transition: all 0.3s ease;
            background: #f8fafc;
        }

        input:focus {
            outline: none;
            border-color: #4299e1;
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.15);
        }

        input:hover {
            border-color: #cbd5e0;
        }

        input[type="file"] {
            padding: 10px;
            background: #f8fafc;
            border: 2px dashed #cbd5e0;
            cursor: pointer;
        }

        input[type="file"]:hover {
            border-color: #4299e1;
            background: #f0f7ff;
        }

        .submit-section {
            grid-column: span 2;
            margin-top: 20px;
            text-align: center;
        }

        button {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            color: white;
            padding: 14px 40px;
            border: none;
            border-radius: 10px;
            font-size: 1.1em;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .separator {
            height: 1px;
            background: #e2e8f0;
            margin: 30px 0;
            grid-column: span 2;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: span 1;
            }

            .container {
                padding: 20px;
            }

            button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-header">
            <h2>update Profile Details</h2>
        </div>

        <form action="EditDetails" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${entity.id}" />

            <div class="form-grid">
                <!-- Personal Information -->
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" value="${entity.name}" />
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${entity.email}"  />
                </div>



                <div class="form-group">
                    <label for="gymName">Gym Name</label>
                    <input type="text" id="gymName" name="gymName" value="${entity.gymName}" />
                </div>

                <!-- Separator -->
                <div class="separator"></div>

                <!-- Membership Details -->
                <div class="form-group">
                    <label for="trainer">Trainer</label>
                    <input type="text" id="trainer" name="trainer" value="${entity.trainer}" />
                </div>

                <div class="form-group">
                    <label for="packaged">Package</label>
                    <input type="text" id="packaged" name="packaged" value="${entity.packaged}" />
                </div>

                <div class="form-group">
                    <label for="amount">Amount</label>
                    <input type="text" id="amount" name="amount" value="${entity.amount}" />
                </div>

                <div class="form-group">
                    <label for="amountPaid">Amount Paid</label>
                    <input type="text" id="amountPaid" name="amountPaid" value="${entity.amountPaid}" />
                </div>

                <div class="form-group">
                    <label for="discount">Discount</label>
                    <input type="text" id="discount" name="discount" value="${entity.discount}" />
                </div>

                <div class="form-group">
                    <label for="balance">Balance</label>
                    <input type="text" id="balance" name="balance" value="${entity.balance}" />
                </div>

                <div class="form-group">
                    <label for="instalment">Instalment</label>
                    <input type="text" id="instalment" name="instalment" value="${entity.instalment}" />
                </div>

                <!-- Profile Photo -->
                <div class="form-group full-width">
                    <label for="file">Profile Photo</label>
                    <input type="file" id="file" name="file" accept="image/*" />
                </div>

                <!-- Submit Button -->
                <div class="submit-section">
                    <button type="submit">Update Profile</button>
                </div>
            </div>
        </form>
    </div>

</body>
</html>