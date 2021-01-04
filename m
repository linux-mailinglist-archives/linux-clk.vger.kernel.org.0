Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2875D2E917A
	for <lists+linux-clk@lfdr.de>; Mon,  4 Jan 2021 09:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbhADIMU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 4 Jan 2021 03:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbhADIMR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jan 2021 03:12:17 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A03DC061574
        for <linux-clk@vger.kernel.org>; Mon,  4 Jan 2021 00:11:37 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id n7so18617205pgg.2
        for <linux-clk@vger.kernel.org>; Mon, 04 Jan 2021 00:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N1N/VRl7IYxshCXfWBMhv9L4GKmc3hy8weZHQ7rGDVA=;
        b=QghjExDFWmmI4IZigyH0QYWlIx8avgEsfnoIs9PxunNbsBTtE923wXAMJEJ+P8/91R
         D6t4C9+Fl9vqSVyfoJtajrm0tne9TxIU3OUCnZ9dLy6Fvo26BpDAse8U9ksRrUOPwLl7
         gExBmitmk3f8rEZLr1a0EnZzJNGzi8qtod2CWAITbLOWjezObnqxSZr4cbCz8V76+A6B
         u4tyT2NFpiAjZa1pfG73A2Z+wTUym7bBHSoT4BcBkkY8VEQ/1THZTpwvCqm74ZXgZvIv
         /Der4OumT93SCJijOyH7oZiqRctlteV9GhRMdxrFHE+mw5VHwsxGCKNBGklCsXEnx86F
         MOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N1N/VRl7IYxshCXfWBMhv9L4GKmc3hy8weZHQ7rGDVA=;
        b=mBu8gYMz1CdkJ76Wg9EkxWUqp+03FVXHmtXOObeT0jdn1qcqHsDKfdSnfx5nQ1Z5aB
         BcmJAhrxb1mdZwMQItJP9UITwxuwuAjj2g+6mNcQZcWdf8NQBYdNB9F4UZvWBX5dBfm+
         CnIzXQ7Gn88wGJedClTyhrx26vPMDMs3Iu6jXL9notuT/c1jE2sVuHIc+dE7VM5c1CZ/
         oxnzT7TM4OvXQAkj7FulR8ljpPCnK4vo4zL07SszCIP1E/uhL/O9sod0RuAPvRXk+ECJ
         6t/AoAzkDFWGFa3sFbFE4bVHrwGkysUiBHsujd830WegXnTY/FYgSkPKhaYRd1/LTQYA
         glpw==
X-Gm-Message-State: AOAM533FX2yWEPDo4ZX24lr9DkrBdiA8U/8y2JpTqHgg/e5dWeGA47Sk
        JKFEsFR4jhqpGMd0wn1oFy5l
X-Google-Smtp-Source: ABdhPJwBWRJhGyCA+bGdgK0mKkSL72v59XaeOdVINrKkcwTDtJKJKyRpAqgAIYgmNPrd78ZrHLSCiw==
X-Received: by 2002:a62:2585:0:b029:1ab:7fb7:b965 with SMTP id l127-20020a6225850000b02901ab7fb7b965mr62847150pfl.2.1609747896658;
        Mon, 04 Jan 2021 00:11:36 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id n7sm55051339pfn.141.2021.01.04.00.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 00:11:36 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/5] Add APCS support for SDX55
Date:   Mon,  4 Jan 2021 13:41:20 +0530
Message-Id: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This series adds APCS mailbox and clock support for SDX55. The APCS IP
in SDX55 provides IPC and clock functionalities. Hence, mailbox support
is added to the "qcom-apcs-ipc-mailbox" driver and a dedicated clock
driver "apcs-sdx55" is added.

Also, the clock to the APCS block is coming from 3 different sources:

1. Board XO
2. Fixed rate GPLL0
3. A7 PLL

First source is from crystal osc, second is from GCC and third one is a
separate clock source. Hence, a dedicated clk driver is added for the A7
PLL as well.

Apart from the mailbox support, another intention of this series is to add
the CPUFreq support to SDX55 platform. Since there is no dedicated hardware
IP in SDX55 to do CPUFreq duties, this platform makes use of the clock and
regulators directly via cpufreq-dt driver.

The trick here is attaching the power domain to cpudev. Usually the power
domains for the target device is attached in the bus driver or in the
dedicated device drivers. But in this case, there is no dedicated CPUFreq
driver nor a bus driver. After discussing with Viresh, I concluded that
A7 PLL driver might be the best place to do this!

But this decision is subject to discussion, hence added Ulf and Viresh to
this series.

Thanks,
Mani

Manivannan Sadhasivam (5):
  dt-bindings: mailbox: Add binding for SDX55 APCS
  mailbox: qcom: Add support for SDX55 APCS IPC
  dt-bindings: clock: Add Qualcomm A7 PLL binding
  clk: qcom: Add A7 PLL support
  clk: qcom: Add SDX55 APCS clock controller support

 .../devicetree/bindings/clock/qcom,a7pll.yaml |  51 ++++++
 .../mailbox/qcom,apcs-kpss-global.yaml        |  59 +++++--
 drivers/clk/qcom/Kconfig                      |  17 ++
 drivers/clk/qcom/Makefile                     |   2 +
 drivers/clk/qcom/a7-pll.c                     | 100 ++++++++++++
 drivers/clk/qcom/apcs-sdx55.c                 | 149 ++++++++++++++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       |   5 +
 7 files changed, 374 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
 create mode 100644 drivers/clk/qcom/a7-pll.c
 create mode 100644 drivers/clk/qcom/apcs-sdx55.c

-- 
2.25.1

