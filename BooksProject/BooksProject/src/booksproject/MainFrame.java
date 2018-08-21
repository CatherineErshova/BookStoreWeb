/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package booksproject;

import java.sql.Connection;//импортируем нужные библиотеки
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author KatyaPc
 */
public class MainFrame extends javax.swing.JFrame {//объявляется главный класс
    
    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pst = null;//переменные, служащие для подключения и работы с базой данных

    /**
     * Creates new form MainFrame
     */
    public MainFrame() {
        initComponents();
        conn = DatabaseConnect.ConnectToDatabase();
        fillGenresList();
        fillAuthorsList();
        //UpdateBooksTable();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        BooksTable = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        GenresComboBox = new javax.swing.JComboBox<>();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        AuthorsComboBox = new javax.swing.JComboBox<>();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        BooksTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(BooksTable);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel1.setText("Жанр книги");

        GenresComboBox.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                GenresComboBoxItemStateChanged(evt);
            }
        });

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel2.setText("Выберите параметры:");

        jLabel3.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel3.setText("Автор книги");

        AuthorsComboBox.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                AuthorsComboBoxItemStateChanged(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(183, 183, 183)
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 165, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 514, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addComponent(jLabel3))
                        .addGap(28, 28, 28)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(AuthorsComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(GenresComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(26, 26, 26)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(GenresComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(AuthorsComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 22, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 275, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(19, 19, 19))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void GenresComboBoxItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_GenresComboBoxItemStateChanged
        AuthorsComboBox.setSelectedItem("не выбран");
        //System.out.println(AuthorsComboBox.getSelectedIndex());
        UpdateBooksTable();
    }//GEN-LAST:event_GenresComboBoxItemStateChanged

    private void AuthorsComboBoxItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_AuthorsComboBoxItemStateChanged
        GenresComboBox.setSelectedIndex(0);
        UpdateBooksTableAuthors();
    }//GEN-LAST:event_AuthorsComboBoxItemStateChanged

    private void UpdateBooksTable(){//функция заполнения таблицы книгами по выбранному жанру
       try {
          int selectedGenre =getIdByGenre(GenresComboBox.getSelectedItem().toString());
          //System.out.println(selectedGenre);

          String sql="SELECT book_title, description, price FROM \"public\".\"Books\" b LEFT OUTER JOIN \"public\".\"GenresOfBooks\" a ON b.\"id\"=a.\"id_book\" WHERE a.\"id_genre\"="+selectedGenre+";";                  
          pst = conn.prepareStatement(sql);
          rs = pst.executeQuery();
          BooksTable.setModel(DbUtils.resultSetToTableModel(rs));
      } catch (Exception e) {
          JOptionPane.showMessageDialog(null, e);
      }
    }
    
     private void UpdateBooksTableAuthors(){//функция заполнения таблицы книгами по выбранному автору
       try {
          int selectedAuthor =getIdByAuthor(AuthorsComboBox.getSelectedItem().toString());
          //System.out.println(selectedGenre);

          String sql="SELECT book_title, description, price FROM \"public\".\"Books\" b LEFT OUTER JOIN \"public\".\"AuthorsOfBooks\" a ON b.\"id\"=a.\"id_book\" WHERE a.\"id_author\"="+selectedAuthor+";";                  
          pst = conn.prepareStatement(sql);
          rs = pst.executeQuery();
          BooksTable.setModel(DbUtils.resultSetToTableModel(rs));
      } catch (Exception e) {
          JOptionPane.showMessageDialog(null, e);
      }
    }
    
    
    private void fillGenresList(){//фунция заполнения выпадающего списка 
        ArrayList<String> Genres = loadGenres();
        GenresComboBox.addItem("не выбран");
        for(int i = 0; i < Genres.size(); i++){
            GenresComboBox.addItem(Genres.get(i).toString());
        }
        
    }
    
     private void fillAuthorsList(){
        ArrayList<String> Authors = loadAuthors();
        AuthorsComboBox.addItem("не выбран");
        for(int i = 0; i < Authors.size(); i++){
            AuthorsComboBox.addItem(Authors.get(i).toString());
        }
    }
    public ArrayList<String> loadGenres(){ //функция получения списка жанров из базы данных
        ArrayList<String> GenresList = new ArrayList<>();
         try {
             String sql = "SELECT genre FROM \"public\".\"Genres\";";
             pst = conn.prepareStatement(sql);
             rs = pst.executeQuery();
             while(rs.next()){
                 GenresList.add(rs.getString("genre"));
             }
         } catch (SQLException ex) {
             JOptionPane.showMessageDialog(null, ex);
         }
        return GenresList;
    }
     public ArrayList<String> loadAuthors(){
        ArrayList<String> AuthorsList = new ArrayList<>();
         try {
             String sql = "SELECT author_name FROM \"public\".\"Authors\";";
             pst = conn.prepareStatement(sql);
             rs = pst.executeQuery();
             while(rs.next()){
                 AuthorsList.add(rs.getString("author_name"));
             }
         } catch (SQLException ex) {
             JOptionPane.showMessageDialog(null, ex);
         }
        return AuthorsList;
    }
    
     public int getIdByGenre(String value){ //функция получающая id жанра в бд по его названию
         int GenreId=0;
         try {
             String sql = "SELECT id FROM \"public\".\"Genres\" WHERE genre=\'"+value+"\';";
             pst = conn.prepareStatement(sql);
             rs = pst.executeQuery();
             while(rs.next()){
                 GenreId=rs.getInt("id");
             }
         } catch (SQLException ex) {
             JOptionPane.showMessageDialog(null, ex);
         }
        return GenreId;
    }
     
     public int getIdByAuthor(String value){
         int AuthorId=0;
         try {
             String sql = "SELECT id FROM \"public\".\"Authors\" WHERE author_name=\'"+value+"\';";
             pst = conn.prepareStatement(sql);
             rs = pst.executeQuery();
             while(rs.next()){
                 AuthorId=rs.getInt("id");
             }
         } catch (SQLException ex) {
             JOptionPane.showMessageDialog(null, ex);
         }
        return AuthorId;
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainFrame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox<String> AuthorsComboBox;
    private javax.swing.JTable BooksTable;
    private javax.swing.JComboBox<String> GenresComboBox;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    // End of variables declaration//GEN-END:variables
}
