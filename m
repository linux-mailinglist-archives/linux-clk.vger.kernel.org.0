Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB28F550C29
	for <lists+linux-clk@lfdr.de>; Sun, 19 Jun 2022 18:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235178AbiFSQuW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 19 Jun 2022 12:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiFSQuV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 12:50:21 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEF663A3
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 09:50:19 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id i10so7920972wrc.0
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LfFFeUv/WOce2TVGlWA/kbyXZ4oXiFmd6tJQ16JvKOc=;
        b=Uz9FKkEA5Qr77ZFCFWzjOSb+r9y8SktCw5Gefi5LohJ8q3EIA9mHNPCDsbAjBz3YQ3
         kq2ZeCv0MW5r9x8STrEw/TJKjCbO8bDvUTmCZvsFN3LrdkUq3ufyEvOHUlaYavbH3ZS2
         WHo7o85cecPwqivfiD2RC7NhiITjW+DPqPbLIxsK9ULBrsM3dWp2pc4E+GBLXEX3CLzq
         7mf+MVYpcogO6fislqudPWDSNQq7Vnk6C/p9C1n1vZT5+xV+HiIf89qQqNtoHIdRmjN1
         K2VSixaUbTZSE4/suL+4JbDPEfmn5C5vsPGg1qR6LDkvCJlu62Ur5+MdPmK8YbwvfCz6
         fSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LfFFeUv/WOce2TVGlWA/kbyXZ4oXiFmd6tJQ16JvKOc=;
        b=dDL0laJeNMTBJKv6dAj692HVH9V7x65p07a0w8pdHv/KhPF3WvUV6eAFNRLfzCrKkN
         Hhy7HgY/Hz/2UedPXVKgP1IRYI/GOPpMn4O3njCdGMDwFTxAUlIhv0Fsjyt+jX3JuMbP
         PEDfv+9WF7UuSIAbxMqEXpPsKIIsUNN549+VfO9IelwgyeY5HWJumWIAabLMGC+5HLe4
         ZA0d6Jricj8r4DxY4rowllZRKAeL//TW+NUbvV3qVT4BuEftey1RxyUGbPNUllCTv1En
         I6Hxs+HaZdWqOgbO63KXwIFAVQy6TJl7jvyxZPKdWmzjlndHIATRTrRALrvFyr7ZiVab
         ZKgw==
X-Gm-Message-State: AJIora+S0ATbpRMHEK1xVMJhQG7cS2QqvjTqI0oKl0Npw2Z7MesoFr5e
        s9ZrKU1+z/BdkXquiUTJmdbIf/UelcDm/S2doBw=
X-Google-Smtp-Source: AGRyM1sDuy+CA51mNE6xs55jBFG/nO7Fc39xXP3E7f6VF9xKHCNHuIdXNqCXWX9sql9FizqHmv6sxg==
X-Received: by 2002:a5d:6a0e:0:b0:213:1f7f:e1cc with SMTP id m14-20020a5d6a0e000000b002131f7fe1ccmr19029817wru.31.1655657417385;
        Sun, 19 Jun 2022 09:50:17 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id m14-20020adfdc4e000000b0021a3c960214sm9189510wrj.6.2022.06.19.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 09:50:16 -0700 (PDT)
From:   Conor Dooley <mail@conchuod.ie>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Daire McNamara <daire.mcnamara@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC 0/6] PolarFire SoC Reset controller
Date:   Sun, 19 Jun 2022 17:49:30 +0100
Message-Id: <20220619164935.1492823-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Hi Stephen (& Philipp),

I gave the aux bus approach to the clock->reset driver combo a go.
Could you take a quick look and lmk if it meets your expectations
for that approach? There weren't too many aux bus drivers to "take
inspiration from" so I implemented this based on drivers/peci/cpu.c
If it all looks sane at first glance, I'll tidy things up a little
and submit.

@Geert the prior "RFC" you said you saw issues with the ethernet?
I implemented the reset stuff for the macs and it looks to be to
be working fine - but I did not do any meaninful testing with
CONFIG_PM=y.

Thanks,
Conor.

(Since it's just the clk -> reset aux bus interface I care about
here, I left the net/dt maintainers off the CC.)*

Conor Dooley (6):
  dt-bindings: clk: microchip: mpfs: add reset controller support
  dt-bindings: net: cdns,macb: document polarfire soc's macb
  clk: microchip: mpfs: add reset controller
  reset: add polarfire soc reset support
  net: macb: add polarfire soc reset support
  riscv: dts: microchip: add mpfs specific macb reset support

 .../bindings/clock/microchip,mpfs.yaml        |  17 +-
 .../devicetree/bindings/net/cdns,macb.yaml    |   1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |   7 +-
 drivers/clk/microchip/Kconfig                 |   1 +
 drivers/clk/microchip/clk-mpfs.c              | 118 +++++++++++--
 drivers/net/ethernet/cadence/macb_main.c      |  25 ++-
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   2 +-
 drivers/reset/reset-mpfs.c                    | 155 ++++++++++++++++++
 include/soc/microchip/mpfs.h                  |   8 +
 10 files changed, 320 insertions(+), 23 deletions(-)
 create mode 100644 drivers/reset/reset-mpfs.c


base-commit: b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
-- 
2.36.1

