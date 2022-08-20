using System;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using Word = Microsoft.Office.Interop.Word;
using System.Collections.Generic;
using System.Linq;

namespace WindowsFormsApplication2
{
    public partial class Form2 : Form
    {
        public static string[] an;
        public static string[] zn;
        public static string[] un;
        public static string[] ti;

        public Form2()
        {
            InitializeComponent();
            textBox1.Text = Form1.sid;
            textBox4.Text = Form1.gender;
            textBox5.Text = Form1.age;
            textBox6.Text = Convert.ToString(Form1.yearNow - Convert.ToInt16(Form1.age));
            LoadData(); 
        }

        private void selNorm(string[] an, string[] zn, string n_min, string n_max, MySqlConnection myConnection) // Вызов значений Нормы по условию
        {
            List<string> unlist = new List<string>();
            int i = 0;
            foreach (string s in an)
            {

                string query = "SELECT Наименование, " + n_min + ", " + n_max + ", Единица_измерения, Тип_исследования, Примечание" + " FROM analysis WHERE id ='" + s + "'";
                MySqlCommand command = new MySqlCommand(query, myConnection);
                MySqlDataReader reader = command.ExecuteReader();
                string[] nanls = new string[6];
                
                while (reader.Read())
                {
                    nanls[0] = reader[0].ToString();
                    nanls[1] = zn[i];
                    nanls[3] = reader[3].ToString();
                    nanls[4] = reader[4].ToString();
                    unlist.Add(nanls[4]);
                    nanls[5] = reader[5].ToString();

                    if (nanls[5] == "")
                    {   
                        // При отсутствии нормы устанавливает знак "<" или ">"
                        if (reader[1].ToString() == "0,00") { nanls[2] = "<  " + reader[2].ToString(); }
                        else if (reader[2].ToString() == "0,00") { nanls[2] = ">  " + reader[1].ToString(); }
                        else { nanls[2] = reader[1].ToString() + " - " + reader[2].ToString(); }
                    }
                    else if (n_min == "Норма_min_жен") nanls[2] = "прим";
                    else    nanls[2] = reader[1].ToString() + " - " + reader[2].ToString();
                }
                reader.Close();
                dataGridView1.Rows.Add(nanls);
                i++;
            }
            un = unlist.Distinct().ToArray(); // Удаляет дубликаты List и вставляет в массив
            ti = unlist.ToArray();
        }

        public string primNorm(int rowi) // Коррекция Нормы по Примечанию
         {
            string nameout = "";
            Form1.myConnection.Open();
             string query = "SELECT Примечание, Норма_min_жен, Норма_max_жен FROM analysis WHERE Наименование ='" + dataGridView1[0, rowi].Value.ToString() + "'";
             MySqlCommand command = new MySqlCommand(query, Form1.myConnection);
             MySqlDataReader reader = command.ExecuteReader();

             while (reader.Read())
             {
                nameout = nameout + reader[0].ToString() + " " + reader[1].ToString() + "-" + reader[2].ToString() + " \r\n";
             }
             reader.Close();
            Form1.myConnection.Close();
            nameout = nameout.Substring(0, nameout.Length - 3);
            return nameout;
         }

        private void LoadData()
        {
            Form1.myConnection.Open();
            // Вызов списка анализов и значений
            string query = "SELECT Анализы,Значения FROM patients WHERE id ='" + Form1.sid + "'";
            MySqlCommand command = new MySqlCommand(query, Form1.myConnection);
            MySqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                an = reader[0].ToString().Split(';');
                zn = reader[1].ToString().Split(';');
            }
                reader.Close();

            // Убирает последний(пустой) элемент в массиве
            Array.Resize(ref an, an.Length - 1);
            Array.Resize(ref zn, zn.Length - 1);

            string n_min; // = "Норма_min";
            string n_max; // = "Норма_max";

            if (Form1.yearNow - Convert.ToInt16(Form1.age) < 16) { n_min = "Норма_min_дет"; n_max = "Норма_max_дет";  }
            else if (Form1.gender == "мужской")                  { n_min = "Норма_min"; n_max = "Норма_max"; }
            else                                                 { n_min = "Норма_min_жен"; n_max = "Норма_max_жен "; }

            selNorm(an,zn,n_min,n_max, Form1.myConnection); 
            
            Form1.myConnection.Close();
        }

        private void button1_Click(object sender, EventArgs e) // Сохранение анализов и значений в базу
        {
            int i = 0;
            textBox2.Clear();
            string anlz = "";
            string znach = "";

            foreach (string s in an)
            {
                if (s == "") continue; // Убирает лишний элемент в массиве
                znach = znach + dataGridView1.Rows[i].Cells[1].Value.ToString() + ";";
                anlz = anlz + s + ";";
                i++;
            }

            Form1.myConnection.Open();
            string query = "Update patients SET Анализы = \"" + anlz + "\" , Значения = \"" + znach + "\" WHERE id = '" + Form1.sid + "';";
            MySqlCommand cmd = new MySqlCommand(query, Form1.myConnection);
            cmd.ExecuteNonQuery();
            Form1.myConnection.Close();

        }

        private void button3_Click(object sender, EventArgs e) // Удаление анализов
        {
            int j = Convert.ToInt16(dataGridView1.CurrentCell.RowIndex.ToString());

            int i = 0;
            //textBox2.Clear();
            //textBox3.Clear();
            string anlz = "";
            string znach = "";

            foreach (string s in an)
            {
                if (s == "") continue; // Убирает лишний элемент в массиве
                if (i != j)
                {
                    znach = znach + dataGridView1.Rows[i].Cells[1].Value.ToString() + ";";
                    anlz = anlz + s + ";";
                }
                i++;
            }

            Form1.myConnection.Open();
            string query = "Update patients SET Анализы = \"" + anlz + "\" , Значения = \"" + znach + "\" WHERE id = '" + Form1.sid + "';";
            MySqlCommand cmd = new MySqlCommand(query, Form1.myConnection);
            cmd.ExecuteNonQuery();
            Form1.myConnection.Close();

            dataGridView1.Rows.Clear();
            LoadData();
        }

        private void button4_Click(object sender, EventArgs e) // Создание Листа Word
        {

            Word.Application wordapp = new Word.Application();
            wordapp.Visible = true;
            Object template = Environment.CurrentDirectory + "\\shema.doc";
            Object newTemplate = false;
            Object documentType = Word.WdNewDocumentType.wdNewBlankDocument;
            Object visible = true;
            Word._Document worddoc;

            //Создаем документ 1
            worddoc = wordapp.Documents.Add(ref template, ref newTemplate, ref documentType, ref visible);

            Object bookmarkNameObj = "FullName";
            Word.Range bookmarkRange = null;
            bookmarkRange = worddoc.Bookmarks.get_Item(ref bookmarkNameObj).Range;
            bookmarkRange.Text = Form1.fullname;

            bookmarkNameObj = "gender";
            bookmarkRange = null;
            bookmarkRange = worddoc.Bookmarks.get_Item(ref bookmarkNameObj).Range;
            bookmarkRange.Text = Form1.gender;

            bookmarkNameObj = "age";
            bookmarkRange = null;
            bookmarkRange = worddoc.Bookmarks.get_Item(ref bookmarkNameObj).Range;
            bookmarkRange.Text = Form1.age;



            // Вычисляем кол строк в таблице для каждого типа анализов
            for (int h = 1; h < un.Length + 1; h++) {

                int rows = 0;
                foreach (string s in ti) { if (un[h - 1] == s) rows++ ; }

            bookmarkNameObj = "titl" + h;
            bookmarkRange = null;
            bookmarkRange = worddoc.Bookmarks.get_Item(ref bookmarkNameObj).Range;

            bookmarkRange.Text = un[h-1];
            bookmarkRange.Font.Size = 12;
            bookmarkRange.Font.Bold = 1;
            bookmarkRange.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
            
            bookmarkNameObj = "Table" + h;
            bookmarkRange = null;
            bookmarkRange = worddoc.Bookmarks.get_Item(ref bookmarkNameObj).Range;
            Object behiavor = Word.WdDefaultTableBehavior.wdWord9TableBehavior;
            Object autoFitBehiavor = Word.WdAutoFitBehavior.wdAutoFitFixed;
            
            int columns = 4; 
            //Добавление таблицы
            worddoc.Tables.Add(bookmarkRange, rows+1, columns, ref behiavor, ref autoFitBehiavor);
            worddoc.Tables[h].Cell(1, 1).Range.Text = "Наименование";
            worddoc.Tables[h].Cell(1, 2).Range.Text = "Значение";
            worddoc.Tables[h].Cell(1, 3).Range.Text = "Норма";
            worddoc.Tables[h].Cell(1, 4).Range.Text = "Ед. изм.";

                // Форматирование текста  таблицы в первой строке
                worddoc.Tables[h].Rows[1].Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
            worddoc.Tables[h].Rows[1].Range.Font.Size = 13;
            worddoc.Tables[h].Rows[1].Range.Font.Bold = 1;

            // Форматирование типа линий таблицы
            worddoc.Tables[h].Borders.OutsideLineStyle = Word.WdLineStyle.wdLineStyleDouble;
            worddoc.Tables[h].Borders.InsideLineStyle = Word.WdLineStyle.wdLineStyleSingle;

            for (int i=0; i < rows; i++)
                {
                    // Выравнивание текста в строкам и Стиль заполнния таблицы
                    worddoc.Tables[h].Rows[i + 2].Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
                    worddoc.Tables[h].Cell(i + 2, 1).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
                    //ширина столбцов
                    worddoc.Tables[h].Columns[2].PreferredWidth = 70;
                    worddoc.Tables[h].Columns[1].PreferredWidth = 240;
                    worddoc.Tables[h].Columns[4].PreferredWidth = 60;

                }

                rows = dataGridView1.Rows.Count;

                for (int j = 0; j < columns; j++)
                {
                    int k = 0; // Коррекция пропущенных строк 
                    for (int i = 0; i < rows - 1; i++)
                    {
                        if (un[h - 1] == dataGridView1[4, i].Value.ToString()) 
                        {
                            if ( dataGridView1[j, i].Value.ToString() == "прим" )
                            {
                                int rowi = i;
                                textBox2.Text = primNorm(rowi);
                                worddoc.Tables[h].Cell(i - k + 2, j + 1).Range.Text = primNorm(rowi);
                            }
                            else { worddoc.Tables[h].Cell(i - k + 2, j + 1).Range.Text = dataGridView1[j, i].Value.ToString(); }
                            worddoc.Tables[h].Cell(i - k + 2, j + 1).VerticalAlignment = Word.WdCellVerticalAlignment.wdCellAlignVerticalCenter; 
                        }
                        else { k++; }
                    }
                }
            }
        }
    }
}



//В ячейке
//worddoc.Tables[1].Cell(2, 3).Width = 40; // Ширина ячейки
//worddoc.Tables[1].Cell(2, 3).Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight;
//worddoc.Tables[1].Cell(2, 3).VerticalAlignment = Word.WdCellVerticalAlignment.wdCellAlignVerticalCenter;
//worddoc.Tables[1].Cell(1, 1).Range.Font.Bold = 1;
//worddoc.Tables[1].Cell(1, 1).Range.Font.Size = 13;

/*string prob = "";
for (int j = 0; j < un.Length; j++) { prob = prob + un[j] + "_"; }
textBox2.Text = prob;*/


