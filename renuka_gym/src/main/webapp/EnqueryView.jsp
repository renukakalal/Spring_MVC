<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enquiry Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f0f4f8;
        }
        .container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 20px;
        }
        h2 {
            color: #1a3b5c;
            border-bottom: 3px solid #1a3b5c;
            padding-bottom: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th {
            background-color: #1a3b5c;
            color: white;
            padding: 12px;
            text-align: left;
        }
        td {
            padding: 12px;
            border-bottom: 1px solid #e0e6ed;
        }
        tr:nth-child(even) {
            background-color: #f1f5f9;
        }
        tr:hover {
            background-color: #e6eaf0;
        }
        @media screen and (max-width: 600px) {
            table {
                border: 0;
            }
            table thead {
                display: none;
            }
            table tr {
                border-bottom: 3px solid #1a3b5c;
                display: block;
                margin-bottom: 10px;
            }
            table td {
                display: block;
                text-align: right;
            }
            table td::before {
                content: attr(data-label);
                float: left;
                font-weight: bold;
                color: #1a3b5c;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Enquiry Details</h2>
        <table>
            <thead>
                <tr>

                    <th>Status</th>
                    <th>Updated Date</th>
                    <th>Updated By</th>
                    <th>Reason</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="dto">
                    <tr>

                        <td data-label="Status">${dto.status}</td>
                        <td data-label="Updated Date & Time">${dto.updatedDate}</td>
                        <td data-label="Updated By">${dto.updatedBy}</td>
                        <td data-label="Reason">${dto.reason}</td>
                        <input type="hidden" name="enquiryId" value="${dto.enquiryId}" />
                        <input type="hidden" name="name" value="${dto.name}" />
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>