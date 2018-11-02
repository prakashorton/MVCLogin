using LoginMVC.Models;
using System;
using System.Data.SqlClient;

namespace LoginMVC.Manager
{
    public class LoginManager
    {
        string connstring = null;
        SqlConnection conn = null;

        public LoginManager()
        {
            connstring = @"Data Source=LAPTOP-CS7AIJH9\SQLEXPRESS;Initial Catalog=DataTracks;Integrated Security=True";
            conn = new SqlConnection(connstring);
            conn.Open();
        }

        public Employee GetCurrentEmployee(string userName)
        {
            Employee employee = new Employee();
            string cmd = "SELECT * FROM [Employee] WHERE [UserName] = @UserName";
            using (SqlCommand loginCmd = new SqlCommand(cmd, this.conn))
            {
                loginCmd.Parameters.AddWithValue("@UserName", userName);
                SqlDataReader reader = loginCmd.ExecuteReader();
                reader.Read();
                employee.Id = (int)reader["Id"];
                employee.Name = (string)reader["Name"];
                employee.UserName = (string)reader["UserName"];
                employee.EmailId = (string)reader["EmailId"];
                employee.Role = (Role)reader["Role"];
                employee.Password = (string)reader["Password"];
                employee.IsActive = (bool)reader["IsActive"];
            }
            return employee;
        }

        public bool CheckLogin(Employee emp)
        {
            bool userStatus = false;
            string cmd = "SELECT COUNT(*) FROM [Employee] WHERE [UserName] = @UserName and [Password] = @Password";
            using (SqlCommand loginCmd = new SqlCommand(cmd, this.conn))
            {
                loginCmd.Parameters.AddWithValue("@UserName", emp.UserName);
                loginCmd.Parameters.AddWithValue("@Password", emp.Password);
                int UserExist = (int)loginCmd.ExecuteScalar();
                if (UserExist > 0)
                {
                    userStatus = true;
                }
            }

            return userStatus;
        }

        public Employee RegisterUser(Employee register)
        {
            if (!ValidateUserName(register))
            {
                string cmdstr = @"INSERT INTO Employee(Name,UserName, Password, EmailId, Role,IsActive) 
                        output INSERTED.ID VALUES(@Name,@UserName, @Password, @EmailId, @Role, @IsActive)";
                using (SqlCommand cmd = new SqlCommand(cmdstr, this.conn))
                {
                    cmd.Parameters.AddWithValue("@Name", register.Name);
                    cmd.Parameters.AddWithValue("@UserName", register.UserName);
                    cmd.Parameters.AddWithValue("@Password", register.Password);
                    cmd.Parameters.AddWithValue("@EmailId", register.EmailId);
                    cmd.Parameters.AddWithValue("@Role", register.Role);
                    cmd.Parameters.AddWithValue("@IsActive", register.IsActive);                    
                    register.Id = (int)cmd.ExecuteScalar();                    
                }
            }
            else
            {
                throw new Exception(register.UserName + " ..!!! User name already exists");
            }
            return register;
        }

        private bool ValidateUserName(Employee employee) {
            bool isUsernameAvaiable = false;
            using (SqlCommand chkUserNameExists = new SqlCommand("SELECT COUNT(*) FROM [Employee] WHERE ([UserName] = @UserName)", this.conn)) {
                chkUserNameExists.Parameters.AddWithValue("@UserName", employee.UserName);
                int UserExist = (int)chkUserNameExists.ExecuteScalar();
                if (UserExist > 0)
                {
                    isUsernameAvaiable = true;
                }
                return isUsernameAvaiable;
            }
        }
    }
}
