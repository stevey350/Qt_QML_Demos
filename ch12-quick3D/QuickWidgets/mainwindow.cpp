#include <QQmlContext>
#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    this->ui->quickWidget->rootContext()->setContextProperty("pos_x", x);
    this->ui->quickWidget->setSource(QUrl::fromLocalFile("E:/MySourceCodes/Qt_QML_Demos/ch12-quick3D/QuickWidgets/test.qml"));
    this->ui->quickWidget->show();
}


void MainWindow::on_btn_move_plus_clicked()
{
    x = x+10;

    qDebug() << "x=" << x;
}

