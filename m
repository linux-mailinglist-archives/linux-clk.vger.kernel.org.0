Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 230E23A09F5
	for <lists+linux-clk@lfdr.de>; Wed,  9 Jun 2021 04:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233601AbhFICYw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Jun 2021 22:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbhFICYv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Jun 2021 22:24:51 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD4E4C061574
        for <linux-clk@vger.kernel.org>; Tue,  8 Jun 2021 19:22:50 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id im10so11165938qvb.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Jun 2021 19:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LCvKUilDPfZP0tRXr2BTP5GTXcy59dD6Uv/t4ZGvryo=;
        b=pPZFzrPf0x+7FfOGC9fhIXoYhM7zez5Jn4byK/NY7Tnh1mBcHplLSG37YW1Ob8/0k4
         zqLnc1ZhCfz19GrQy0wgYJdvMrf8Pw2eEznTNLYprtDPT5WxdEdFb8dbHxgTEpir83/8
         +wvnjm01dXk1/ra42X78wDnW7s9xWjTk+pnD4nzpGa371MasCJfs7Zx1kUupGvM9wG1U
         qw+qoUExtfX1BgSbvLm6b8ggTTvv7JAJONCUAht8G8TNcFZpEpkKgGjdlKllNlLjBlfC
         MC7kbw/fxC1iKP45Yoo1OKxmDzSHrNVAmH/5WusA/NbChCGbmucMRLWDc37cuo4pL8Fr
         70Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LCvKUilDPfZP0tRXr2BTP5GTXcy59dD6Uv/t4ZGvryo=;
        b=eyWvcgoPdHYfvPBQiphpLSIVuhvyJmKXCANCEHcWiPh6Z6G3boZ1RLJrOmwSVahwRq
         TC7JfqGZU24WPhNUIzaNNOq8/5+iEg1Tv8xYx3OLgDO6jEyvtmWHr+K5kEk1rl1haVrp
         dVRkRBb9ItBuoSKLL/M+2NU7MJ0lqe3DczQr6Yuri75aBsnbCKmAB5HroZkjoWALqiZB
         fnk7cnU2UcP6oCzIQYoEI/8oXOsU6gAu7yI31CWYflrTlltpJfLF5DH+Uh8Fcy+VRdRk
         iZCWRpb8H06Rdmv9lSTIT9MvlG0GZ0za39evYs+KV5MHnFHYyPCZbjUki96hj0v81USd
         ChpQ==
X-Gm-Message-State: AOAM532U01i9BK6010rlAyYE1yXC+rosvZdhOInfhAaqrdoH3BZoL75j
        4VhwuSzHS5vYL6cJWG8cEEL2kA==
X-Google-Smtp-Source: ABdhPJzBzO5wxWwm9VULKejbsZYjQj14rpS6V39wNy7hhCur1u38iQx1yBSBo8YhHwX+WwqvU+q7Bg==
X-Received: by 2002:ad4:4ea8:: with SMTP id ed8mr3698138qvb.58.1623205370108;
        Tue, 08 Jun 2021 19:22:50 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id h6sm7004657qtr.73.2021.06.08.19.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 19:22:49 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list),
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 0/3] clk: qcom: Add camera clock controller driver for SM8250
Date:   Tue,  8 Jun 2021 22:20:45 -0400
Message-Id: <20210609022051.2171-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

v2:
  - zonda pll:
   - Re-use clk_alpha_pll_postdiv_fabia_ops for postdiv ops
   - Use clk_alpha_pll_write_config helper for configure function
   - Remove dubious memory barriers that were copied from downstream
   - Use pll_alpha_width() for ALPHA_VAL size (downstream uses 32 but it turns
     out the 16 returned by pll_alpha_width is the correct value)
   - Use clk_trion_pll_recalc_rate for recalc_rate function
   - Remove error checking on regmap functions (mmio can't fail)
 - bindings: fix a copy-paste error
 - camcc:
   - lowercase hex, remove stray commented out line, fix double semicolon
   - add missing call to clk_zonda_pll_configure for pll2

Jonathan Marek (3):
  clk: qcom: clk-alpha-pll: add support for zonda pll
  dt-bindings: clock: add QCOM SM8250 camera clock bindings
  clk: qcom: Add camera clock controller driver for SM8250

 .../bindings/clock/qcom,camcc-sm8250.yaml     |   68 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8250.c               | 2456 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |  174 ++
 drivers/clk/qcom/clk-alpha-pll.h              |    6 +
 include/dt-bindings/clock/qcom,camcc-sm8250.h |  138 +
 7 files changed, 2850 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8250.h

-- 
2.26.1

