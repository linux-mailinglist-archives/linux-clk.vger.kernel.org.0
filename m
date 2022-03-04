Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54EEB4CD1E9
	for <lists+linux-clk@lfdr.de>; Fri,  4 Mar 2022 11:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239455AbiCDKER (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 4 Mar 2022 05:04:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239268AbiCDKEQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Mar 2022 05:04:16 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61321188A13
        for <linux-clk@vger.kernel.org>; Fri,  4 Mar 2022 02:03:27 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id o26so7094067pgb.8
        for <linux-clk@vger.kernel.org>; Fri, 04 Mar 2022 02:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y54ktKd4wc7WsH7lw6nZsgyvKLTv134GmA+zY8xdjj4=;
        b=SGZDKXJePqBrV0sAxLu6XG0/dxI/VUB1sBhx4bWpguzOlmVucZuK0rU+0cKa9NS2nf
         n0sxUh4eQaRX+dqRtbhOrpQ/QA6FqjiEVrcfZfsR1pOvX9RZkuoWwkNWZ/xgta1WZJrC
         oDSL2R8LL9Bj8aHcuzxidIZbjYixL/+j6+RO/5Tko/G4gi4k8EmJAizUZr02yXFwW7E0
         K8nk4bqEMywWkdPm2XEQUKSZTRIQkzsEOxeJUAUZsTylV4ccum9INs3WPCtgTKZBsUUP
         GbFzmTbpr8Yn/UpFMp+DacXIE2/oFxZ4BPsAhKJJO4VpgDT+okw5+w9eJsKno9Oc0x0l
         MUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y54ktKd4wc7WsH7lw6nZsgyvKLTv134GmA+zY8xdjj4=;
        b=uTuGInaMjNV0yN+a4IU2ovLjZunbINw/TyAFqKO66sq6nV1HCBOrjd25HgPGM/q7yN
         mOzeR+V/IGgKJSDcjMsDRfZQZU+53nwvRFYDhXRO29u6F27Kd6/cKG/f6Ijvng3P1Ty7
         GLxVmWZomNvNZFc5wLTe2bvPY5T3JcLtnAJ5M3kLUAmTWB4Zjtba+/oFBBg6Za1UNlfv
         KmSR5WeZRLjM+FkTW2FC17xwIiwYK+qAYOUJnXj00M260H9aZqSF5ZcM1JJ64fslLHPb
         MYOnOS0Ho2MidFR85Hfr57kiL83bSMbhgbQUZ5g1OovnEU1XzK1jE46jkMI0ZPyis6jU
         7ZCw==
X-Gm-Message-State: AOAM5329TX+SGtmxG4v6npgkCc+g1NUVSLxB+YTcJNT3227ss4Zaj1AJ
        c8GTLzU1gwkiRNdXJ2LawW4mCg==
X-Google-Smtp-Source: ABdhPJwbdj2tEKA67YJ7rF/2kNeOsmHdJCZ/olVb/rnSSwnSH/sL0zqFgLqTs1dIeVm8a7KlmHDaww==
X-Received: by 2002:a05:6a00:887:b0:4f2:6d3f:5b53 with SMTP id q7-20020a056a00088700b004f26d3f5b53mr43055145pfj.21.1646388206921;
        Fri, 04 Mar 2022 02:03:26 -0800 (PST)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id j8-20020a056a00174800b004f26d3f5b03sm5461605pfc.39.2022.03.04.02.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 02:03:26 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, lee.jones@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 0/5] Refactor the PRCI driver to reduce the complexity
Date:   Fri,  4 Mar 2022 18:03:16 +0800
Message-Id: <cover.1646388139.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch set tries to improve the PRCI driver to reduce the
complexity, we remove the SoCs C files by putting putting all stuff in
each SoCs header file, and include these SoCs-specific header files in
core of PRCI. It can also avoid the W=1 kernel build warnings about
variable defined but not used [-Wunused-const-variable=], like 'commit
487dc7bb6a0c ("clk: sifive:fu540-prci: Declare static const variable
'prci_clk_fu540' where it's used")' does.

This patch set also contains the dt-bindings and dts change, because
we change the macro name for fu540 and fu740 by adding the prefix
respectively.

Thanks all for your review and suggestions.

Changed in v2:
 - Rebase on v5.17-rc6
 - Add a temporary patch for avoiding breaking git bisect

Zong Li (5):
  clk: sifive: duplicate the macro definitions for the time being
  dt-bindings: change the macro name of prci in header files and example
  riscv: dts: Change the macro name of prci in each device node
  clk: sifive: Add SoCs prefix in each SoCs-dependent data
  clk: sifive: Move all stuff into SoCs header files from C files

 .../devicetree/bindings/gpio/sifive,gpio.yaml |   2 +-
 .../bindings/pci/sifive,fu740-pcie.yaml       |   2 +-
 .../bindings/serial/sifive-serial.yaml        |   2 +-
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  22 +--
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  26 ++--
 drivers/clk/sifive/Makefile                   |   2 +-
 drivers/clk/sifive/fu540-prci.c               |  89 ------------
 drivers/clk/sifive/fu540-prci.h               |  91 +++++++++++-
 drivers/clk/sifive/fu740-prci.c               | 134 ------------------
 drivers/clk/sifive/fu740-prci.h               | 130 ++++++++++++++++-
 drivers/clk/sifive/sifive-prci.c              |   5 -
 include/dt-bindings/clock/sifive-fu540-prci.h |   8 +-
 include/dt-bindings/clock/sifive-fu740-prci.h |  18 +--
 13 files changed, 254 insertions(+), 277 deletions(-)
 delete mode 100644 drivers/clk/sifive/fu540-prci.c
 delete mode 100644 drivers/clk/sifive/fu740-prci.c

-- 
2.31.1

