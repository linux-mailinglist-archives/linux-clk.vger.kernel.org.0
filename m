Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 553CC25CD73
	for <lists+linux-clk@lfdr.de>; Fri,  4 Sep 2020 00:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729036AbgICW1P (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Sep 2020 18:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728288AbgICW1N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Sep 2020 18:27:13 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6103C061245
        for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2020 15:27:12 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id b3so3189020qtg.13
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2020 15:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9SpSwMIgy/0uDv9Hc0PvSjCztNMgh+f4IT2tkCaQkW4=;
        b=PqLGbKMp2gjiffHSrlocu7l+Z3ajwgMd1X3CxsA+yNf4pwuW1nDh2A5P+x5XtNvX1h
         goUHuIX34yVxPumhBEKDfmhGjy0yCNAqzPU3XzE8c25pUQZE5R3WWiYaTzaE8MayTTwN
         d+bw8tnnyR7Gu/EeVMxOJW0QzuHADNhxpJuynXH9pod1M04KRFjIgXdO+L6app7bNmPF
         oQNDI9cQQwz1Xa1kxrpNhmoTnt7kDoavfajq6JcBKsCUx+XOVrmi0gY1PyVd2+gNVtDO
         IkaY/TD90aNvonnCrlZIeyI4+su8YfM8rG8CWTeF5lgVbdb+hJJlNmvIFmiJQh844a1G
         EPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9SpSwMIgy/0uDv9Hc0PvSjCztNMgh+f4IT2tkCaQkW4=;
        b=qZq7Rct22mvMvnXIa2kdXdD9nO5NgETJR113mNQuOoaIOGwdjtZSpLd2dD6HwCtNKF
         nU8lhT/OTP+erjufcUKL8S7+1mtQhPRJ3N22mlpJB6MxocbpDrIdaKtRwtNO68OojbgW
         3U0Uhp3bfZklA9Co7KfOp82FSkuyEnIuG/kBvvcMrk0r+607dfhLTQjaOwuT9lT8JWjd
         iP//XfbUReTX0vZc9u122NdXl7q5GTVs9rxyq6YFJWSsiEEJ1JEjFJgGyhVPHNsmzLFB
         xlUvfuZ/NP/PUiDepdew0nJmS68ILqiBdh6kIBya18rAsGxasHJhI4SiHNbF50kJrI6V
         cyCA==
X-Gm-Message-State: AOAM533D20sChzoXZ8zFTifuVdGORZdE3UjVf2Lp0keI2W4tp7MgaUSd
        tK1gHgAbPoCQgly3wfmrJloiMQ==
X-Google-Smtp-Source: ABdhPJyX2L6/vlPMY77nburHLozkIx336EIl0ufaIwZ6yu03grC4E5axYN4yguWf2gLAO+aUHM6K/g==
X-Received: by 2002:ac8:b46:: with SMTP id m6mr5741737qti.72.1599172031736;
        Thu, 03 Sep 2020 15:27:11 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id y30sm3217157qth.7.2020.09.03.15.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:27:11 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list),
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 0/7] SM8150 and SM8250 dispcc drivers
Date:   Thu,  3 Sep 2020 18:26:08 -0400
Message-Id: <20200903222620.27448-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add display clock drivers required to get DSI and DP displays working on
SM8150 and SM8250 SoCs.

Derived from downstream drivers. Notable changes compared to downstream:
 - EDP clks removed (nothing uses these even in downstream it seems)
 - freq_tbl values for dp_link clk is in Hz and not kHz

v2:
 - updated dts example to reflect the change (first patch)
 - updated config_ctl_hi1_val in sm8250 dispcc to latest downstream

Jonathan Marek (7):
  dt-bindings: clock: sdm845-dispcc: same name for dp_phy clocks as
    sc7180
  arm64: dts: qcom: sdm845-dispcc: same name for dp_phy clocks as sc7180
  dt-bindings: clock: combine qcom,sdm845-dispcc and qcom,sc7180-dispcc
  dt-bindings: clock: Introduce QCOM SM8150 display clock bindings
  dt-bindings: clock: Introduce QCOM SM8250 display clock bindings
  clk: qcom: Add display clock controller driver for SM8150
  clk: qcom: Add display clock controller driver for SM8250

 ...om,sdm845-dispcc.yaml => qcom,dispcc.yaml} |   30 +-
 .../bindings/clock/qcom,sc7180-dispcc.yaml    |   86 --
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |    4 +-
 drivers/clk/qcom/Kconfig                      |   18 +
 drivers/clk/qcom/Makefile                     |    2 +
 drivers/clk/qcom/dispcc-sm8150.c              | 1152 +++++++++++++++++
 drivers/clk/qcom/dispcc-sm8250.c              | 1100 ++++++++++++++++
 .../dt-bindings/clock/qcom,dispcc-sm8150.h    |   69 +
 .../dt-bindings/clock/qcom,dispcc-sm8250.h    |   66 +
 9 files changed, 2428 insertions(+), 99 deletions(-)
 rename Documentation/devicetree/bindings/clock/{qcom,sdm845-dispcc.yaml => qcom,dispcc.yaml} (75%)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8150.c
 create mode 100644 drivers/clk/qcom/dispcc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8150.h
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8250.h

-- 
2.26.1

