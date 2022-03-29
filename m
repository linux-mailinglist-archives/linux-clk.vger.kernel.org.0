Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 037134EB31B
	for <lists+linux-clk@lfdr.de>; Tue, 29 Mar 2022 20:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240422AbiC2SHn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 29 Mar 2022 14:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240427AbiC2SHm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 14:07:42 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545E8B1AA5;
        Tue, 29 Mar 2022 11:05:59 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id u26so21590608eda.12;
        Tue, 29 Mar 2022 11:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GGrpFH5phWb+a/AcSK50FO4nyjVG2fRoM+DCfzaYwlA=;
        b=F1xbWJaHXTIAhapaNMV6NPLmO7MCVyQwAalWZh0xnJcZHt4W+oPxaGfC3mgHZvD2ga
         3vKPwOyjCTRCZQtCb9LT7cxUUXXHxex+n+38icpk19Gjz20gQXicGsHsEt0JMdLzdZso
         54k8cRC2FNN0lM87RTnlvl23w+lqZ06NYhg0b7aqHXN+6tZr766kq32Vb+6XaTMoAlRl
         Z1b/CZy+IXmAv/DgGwO3GLIhRCLJ3rjeR+ZPffK1sugB93HubGFq4uXrT2NFmHG5Cp5Y
         9bz74YiOjRG51t6ewy1tQ2ChWnJesl7OTKwof0KgtqHLkKA4MdEaA3S/RfRb9qR5wLLK
         zAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GGrpFH5phWb+a/AcSK50FO4nyjVG2fRoM+DCfzaYwlA=;
        b=l7zVV5PSdsKX2T4HaGBOXRo9tlBDNBgUstQupudUTwwM6d+hAqiG+CV2ZgzUqMlp93
         aTY2TNYDgqW/XtRj4IvzojANtoiaS+HVYrQ2XBsD9XnskW+8idu0KiJFouo+QAZ4DmQw
         bY4QFWz5p5p+zJ/1TqnLgF0d5SLwjUQfmSYDj1zfVFNG870XHegyGoNQZaMf+iBCaay/
         o0mE6KvPUct3nFYamljUYlyaEYXtN9nNLmOKFpouQxNA/dQ0U3km4kV2bFEfmiZ3ymRc
         Yw5LWcth93BF8tgGyHa+T6sLXksKVFD8to9UZJKTaJqGVPsAlpFIC3JhSxabwTCZ4gYb
         uFNQ==
X-Gm-Message-State: AOAM530CTdZBDnernZrSAYZprMCXubY8C+I/5fhjLBFaQ5cJ6w6h4waA
        mDNgNswuYPTC494pJDUR+xJoPBmaZ2c=
X-Google-Smtp-Source: ABdhPJw3kPT+km8qTjd04hgMG3/SJUcXDRsW6sh05uEGi7WFXacU6sNBumsFy1mCmMB8DL0PQIsx2g==
X-Received: by 2002:a05:6402:14b:b0:418:d06e:5d38 with SMTP id s11-20020a056402014b00b00418d06e5d38mr6148877edu.90.1648577157850;
        Tue, 29 Mar 2022 11:05:57 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id j21-20020a170906255500b006e08c4862ccsm6443616ejb.96.2022.03.29.11.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 11:05:57 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de, zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: rockchip: add clocks property to cru node rk3368
Date:   Tue, 29 Mar 2022 20:05:50 +0200
Message-Id: <20220329180550.31043-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220329180550.31043-1-jbx6244@gmail.com>
References: <20220329180550.31043-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocks and clock-names because the device has to have
at least one input clock.
Also in case someone wants to add properties that start with
assign-xxx to fix warnings like:
'clocks' is a dependency of 'assigned-clocks'

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index c99da9032..4f0b5feaa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -747,6 +747,8 @@
 	cru: clock-controller@ff760000 {
 		compatible = "rockchip,rk3368-cru";
 		reg = <0x0 0xff760000 0x0 0x1000>;
+		clocks = <&xin24m>;
+		clock-names = "xin24m";
 		rockchip,grf = <&grf>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
-- 
2.20.1

