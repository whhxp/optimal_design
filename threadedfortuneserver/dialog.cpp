/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include <QtWidgets>
#include <QtNetwork>

#include <stdlib.h>

#include "dialog.h"
#include "fortuneserver.h"

void Dialog::start_server()
{
    timer->start(1000);
    startButton->setEnabled(false);
    stopButton->setEnabled(true);
    start_moga();
}

void Dialog::stop_server()
{

    startButton->setEnabled(true);
    stopButton->setEnabled(false);
}
Dialog::Dialog(QWidget *parent)
    : QWidget(parent)
{
    statusLabel = new QLabel;
    statusLabel->setWordWrap(true);
    quitButton = new QPushButton(tr("&Quit"));
    quitButton->setAutoDefault(false);
    startButton = new QPushButton(tr("&Start"));
    startButton->setEnabled(true);
    startButton->setDefault(true);
    stopButton = new QPushButton(tr("&Stop"));
    stopButton->setEnabled(false);
    stopButton->setDefault(true);

    timer = new QTimer(this);
//! [0]
    udpSocket = new QUdpSocket(this);
//! [0]
    messageNo = 1;
    if (!server.listen()) {
        QMessageBox::critical(this, tr("MOGA computing Server"),
                              tr("Unable to start the server: %1.")
                              .arg(server.errorString()));
        close();
        return;
    }
    QString ipAddress;
    QList<QHostAddress> ipAddressesList = QNetworkInterface::allAddresses();
    // use the first non-localhost IPv4 address
    for (int i = 0; i < ipAddressesList.size(); ++i) {
        if (ipAddressesList.at(i) != QHostAddress::LocalHost &&
            ipAddressesList.at(i).toIPv4Address()) {
            ipAddress = ipAddressesList.at(i).toString();
            break;
        }
    }
    // if we did not find one, use IPv4 localhost
    if (ipAddress.isEmpty())
        ipAddress = QHostAddress(QHostAddress::LocalHost).toString();
    statusLabel->setText(tr("The server is running on\n\nIP: %1\nport: %2\n\n"
                            "Run the MOGA optimizatioin now.")
                         .arg(ipAddress).arg(server.serverPort()));


    connect(startButton, SIGNAL(clicked()), this, SLOT(start_server()));
    connect(stopButton, SIGNAL(clicked()), this, SLOT(stop_server()));
    connect(quitButton, SIGNAL(clicked()), this, SLOT(close()));
    //connect(timer, SIGNAL(timeout()), this, SLOT(broadcastDatagram()));
    connect(timer, SIGNAL(timeout()), this, SLOT(broadcastDatagram()));

    QHBoxLayout *buttonLayout = new QHBoxLayout;
    buttonLayout->addStretch(1);
    buttonLayout->addWidget(quitButton);
    buttonLayout->addWidget(startButton);
    buttonLayout->addWidget(stopButton);

    QVBoxLayout *mainLayout = new QVBoxLayout;
    mainLayout->addWidget(statusLabel);
    mainLayout->addLayout(buttonLayout);
    setLayout(mainLayout);
    setWindowTitle(tr("MOGA parallel computing Server"));
}

void Dialog::broadcastDatagram()
{
    statusLabel->setText(tr("Now broadcasting datagram %1").arg(messageNo));
//! [1]
    QByteArray datagram = "Broadcast message " + QByteArray::number(messageNo);
    udpSocket->writeDatagram(datagram.data(), datagram.size(),
                             QHostAddress::Broadcast, server.serverPort());
//! [1]
    ++messageNo;
}

void Dialog::check_moga_finished()
{

}
