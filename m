Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1E4130E57
	for <lists+linux-clk@lfdr.de>; Mon,  6 Jan 2020 09:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgAFIG3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 6 Jan 2020 03:06:29 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43337 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgAFIG3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Jan 2020 03:06:29 -0500
Received: by mail-pl1-f196.google.com with SMTP id p27so21558012pli.10
        for <linux-clk@vger.kernel.org>; Mon, 06 Jan 2020 00:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kc4OOP9HlDHrazGn8ygbL0+SnkDIKiZeyDLgjyCdafs=;
        b=N6vlhfEmOvMy7F7CmodSMsAX5uy/sztUmVOPhLo8EIl9iFwQ2NLWDi1zBiQ0HUI+ro
         H563QhrI02xzr4klertPbDzI0unhimjQiTnFJo9Lm/Y5LNTk7uQDut/SczTOtbFuvfFy
         T67gJwf+zgRk1FzK/lyW90NtqOanKwHtonwbvMw3QYn1nQeU/MYxDRE9oMfGw9yOKWz+
         R8hxdeoq07y1LNcYCPr4h+rDa12O9RqgQPqubsGtauUci2YgAYgyBn6YjxkUe+fniB3F
         AwcjV8JD6WgPv2DEehMpZ9CoJhopQgW3nafA0e470xlqukNHjbhNdSOkkOZynRJ+An8G
         VJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kc4OOP9HlDHrazGn8ygbL0+SnkDIKiZeyDLgjyCdafs=;
        b=HYBFQVObiHXHd+9Kigjph8s6hLbsjebuuW15R30nLoQN5V/z/ixc9mwHkgKBi29xhI
         r/F660zGpdGxPMeCB7ACmmczGFFFnQRyaPfUrgydXh3f4P4mdNL/5wGUz743Nt3uI2in
         YPvKgjmBVDltqKnZAhzTE01EwNDbvM7kMhyO84nd2DzD0vFqs40NymDJ9gxBMzsu52dD
         Bz2UrHpd38ncgGz+wq8JPCfWomyrLdNsvPOfmZRGOD7sLbyb3/DOtD97W+aREGpZeZ7v
         XyTIsVH6uNGaHZvaLfYfligQaZu70jXVorL+6re2+qdwz8IR8TRNKy1pBJeiCovmGYP3
         lXYA==
X-Gm-Message-State: APjAAAWqYXTo5X9Zwhi7VW5zLKidczDAhQD2EaJWhIltGX/CrHmURTpV
        HTv36fVmglqCR5eG5iap6bU0uA==
X-Google-Smtp-Source: APXvYqzPwEbf3yDTuo1YSLiQbcrhWeM/h2hOgU19IgmTT+k+BL1n/XH4cHd3sSgnA+OFj25/f1W7Gw==
X-Received: by 2002:a17:902:d898:: with SMTP id b24mr100079663plz.133.1578297988771;
        Mon, 06 Jan 2020 00:06:28 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y20sm11916038pfe.107.2020.01.06.00.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 00:06:28 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] clk: qcom: gcc-msm8996: Fix CLKREF parenting
Date:   Mon,  6 Jan 2020 00:05:44 -0800
Message-Id: <20200106080546.3192125-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We've always seen intermittent resets of msm8996 during boot, seemingly related
to PCIe somehow. The likely cause of these errors are the fact that the CLKREF
of all PHYs are parented by LN_BB, which while being on during boot is disabled
by the UFS host driver if it fails to find its PHY.

As such, depending on the timeing (and success) of the UFS initialization, PCIe
might loose its clocking.

These two patches ensures that LN_BB, connected to the CXO2 pad on the SoC, is
described as parent for all the CLKREF clocks. So that they all vote for this
clock appropriately.

Bjorn Andersson (2):
  clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
  arm64: dts: qcom: msm8996: Define parent clocks for gcc

 .../devicetree/bindings/clock/qcom,gcc.yaml   | 10 ++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  3 ++
 drivers/clk/qcom/gcc-msm8996.c                | 35 +++++++++++++++----
 3 files changed, 41 insertions(+), 7 deletions(-)

-- 
2.24.0

