Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47F46BCB94
	for <lists+linux-clk@lfdr.de>; Tue, 24 Sep 2019 17:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390104AbfIXPef (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 24 Sep 2019 11:34:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52024 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389843AbfIXPeG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Sep 2019 11:34:06 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so680776wme.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2019 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/6U0dD6MUksHFpVm7wa9mkxmmUXgE/bvyBC/yWmtuac=;
        b=ENmg69JkLlL6al4mCpoNEnItL3MPTJ2O/4FCgRDGTN54fVEiM+6esWgvpOGCeQQGUP
         LPQhUjQ2bxV+E/pkQqLcHl08RbfcEpmvxa/RzM0Mxsgu/P3XFKSlr8IviDsRC9q1Mjr9
         WVrCMIqk8A4h+z82BBgugzy7uRTgiDrpGUi9dEuI7/ln5kEFzxoNM0RNjS74ZTncDDZt
         IjC0b8rZOsFDRX5XRrg55qBsantQSfgYSB7QxJra+ED/Hx9SMVtv7RaSr1VOpEwdIQYN
         rLcTRuOTiA4gjiWsHl/PbY3y/jD513BUHSW5dzqwe0tv7nlMCILatijOAx/yajVO0J64
         Uvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/6U0dD6MUksHFpVm7wa9mkxmmUXgE/bvyBC/yWmtuac=;
        b=KBVMyDSkfV+OPmMQKsCqOkMRsgnWOvIegj23mJKK+ssvVgz8Ehgv8YEcN+B/npxMaN
         1/i2DahdppAmlNF2jcThCMWJj5Rt6Jz++4emjVJ698JE9dA/Jy/mOuHlVfOCx4qvPC3t
         aM7qsnak2+WnVv+kxfn6+oadxHgv07bqsTGimjV4MG9BGY1jtXb+JQANQwmRfG1/Q/ga
         lGuwJbxyMK+r5U6XWUJCzz8Ab2C3NZhkkwZD1JdbXBxzkONE5bB8MHFivcYn0dE8hqWc
         opGVSDXmj5ogey0YY9UaDRcEd1XXpiBA3Cdp633VucLuTkaiFKCgSkG1JJJZEgf8Th//
         tnYQ==
X-Gm-Message-State: APjAAAVmU0UN5mk30zaSlmkNNt1dVgrGsaId+B9L/nTxjsrGOt+1ZO1w
        HDIfQ3s6f2qWdlJok0t2xrOf6g==
X-Google-Smtp-Source: APXvYqzc9jIyVzj4/0TJlwQz28F05Oja/DxjUInxa5uqc/lU/KilTyRJhLm8SLE90HtqjzOkO83WwQ==
X-Received: by 2002:a05:600c:54a:: with SMTP id k10mr730127wmc.127.1569339242941;
        Tue, 24 Sep 2019 08:34:02 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id d10sm144240wma.42.2019.09.24.08.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 08:34:02 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: clock: meson: add sm1 resets to the axg-audio controller
Date:   Tue, 24 Sep 2019 17:33:51 +0200
Message-Id: <20190924153356.24103-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924153356.24103-1-jbrunet@baylibre.com>
References: <20190924153356.24103-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the reset id of the sm1 audio clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../reset/amlogic,meson-g12a-audio-reset.h        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
index 14b78dabed0e..f805129ca7af 100644
--- a/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
@@ -35,4 +35,19 @@
 #define AUD_RESET_TOHDMITX	24
 #define AUD_RESET_CLKTREE	25
 
+/* SM1 added resets */
+#define AUD_RESET_RESAMPLE_B	26
+#define AUD_RESET_TOVAD		27
+#define AUD_RESET_LOCKER	28
+#define AUD_RESET_SPDIFIN_LB	29
+#define AUD_RESET_FRATV		30
+#define AUD_RESET_FRHDMIRX	31
+#define AUD_RESET_FRDDR_D	32
+#define AUD_RESET_TODDR_D	33
+#define AUD_RESET_LOOPBACK_B	34
+#define AUD_RESET_EARCTX	35
+#define AUD_RESET_EARCRX	36
+#define AUD_RESET_FRDDR_E	37
+#define AUD_RESET_TODDR_E	38
+
 #endif
-- 
2.21.0

