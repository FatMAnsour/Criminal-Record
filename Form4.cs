using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WindowsFormsApplication2
{
    public partial class Form4 : Form
    {
        SqlConnection cn = new SqlConnection(@"Data Source=DESKTOP-PA484GT\\DP;Initial Catalog=CriminalRecord;Integrated Security=True");
          SqlCommand cmd;
        SqlDataReader dr;
        public Form4()
        {
            //InitializeComponent();
            //cmd = new SqlCommand("Select * From criminal", cn);
            //cn.Open();
            //dr = cmd.ExecuteReader();
            //while(dr.Read())
            //{
            //}
            
        }
     // public string constring ="";
    private void label9_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
           try{
                cmd =new SqlCommand( "insert into criminal(criminal_dob,criminal_address,criminal_FN,criminal_MN,criminal_LN,blood_type,body_build,gender,criminal_weight,criminal_height,occupation,marital_statues)VALUES('" + textBox4.Text + textBox6.Text+ textBox1.Text+ textBox2.Text+ textBox3.Text + textBox13.Text.ToString() + textBox12.Text + comboBox1.SelectedItem + textBox10.Text + textBox11.Text + textBox7.Text + comboBox2.SelectedItem + "')");
             // string q ="insert into criminal(criminal_FN,criminal_MN,criminal_LN,blood_type,body_build,gender,criminal_weight,criminal_height,occupation,marital_statues,criminal_dob,criminal_address)valuse('"+textBox1.Text.ToString()+textBox2.Text.ToString()+textBox3.Text.ToString()+textBox13.Text.ToString()+textBox12.Text.ToString()+comboBox1.SelectedItem+textBox10.Text.ToString()+textBox11.Text.ToString()+textBox7.Text.ToString()+comboBox2.SelectedItem+textBox4.Text.ToString()+textBox6.Text.ToString()+"') ";
                cn.Open();
            cmd.ExecuteNonQuery();
               MessageBox.Show("succefuly added","ADD" ,MessageBoxButtons.OK,MessageBoxIcon.Information);

           }
            catch (SqlException ex)
           {
                MessageBox.Show("some error happened"+ex.Message);

            }
            finally{

               cn.Close();
           }
           
                 this.Hide();
              new Form5().Show();
            }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        }

       
      
}
