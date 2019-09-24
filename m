Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B181EBCB95
	for <lists+linux-clk@lfdr.de>; Tue, 24 Sep 2019 17:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389960AbfIXPeE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 24 Sep 2019 11:34:04 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55585 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389866AbfIXPeD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Sep 2019 11:34:03 -0400
Received: by mail-wm1-f67.google.com with SMTP id a6so645168wma.5
        for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2019 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OwFyXGBqFYuC/YIQ48LJbHRdAjX7P5PZkteQ+2xVhOw=;
        b=IwL+hTlRWqUjdAXdcuQwYePG18rcM/tDvvnrZiseWHuBOGL1ziNS5lPODy1pd0AIKd
         Re1CE5+HhGzrPRRCDiXbGKnvZNz7d2F2COSpFwxTp2rW/AS59ZKtxtj++NWpS/kv5P20
         gF30NCWIrE5aM9IipkS26V0RuWHriDXgF+wXeumjxADKxYPa8lv9kUfM3aJezJxEXaNG
         /CWf5UW5CNC/DoxriBzwI2YnxJWnJu8NC10mzqYUiDKi2RuofyIECfHx0/Tsh1f7s3Yt
         hsK4484mZfZz39MsAaPLf5YYr0wGNVlLDworXDOnLTqYYwWfifmVZQJdytpn2RPnunhk
         ZDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OwFyXGBqFYuC/YIQ48LJbHRdAjX7P5PZkteQ+2xVhOw=;
        b=Wt1oYAEctbA5m/SHPuJyJURPoBstcWpegfAcWdPivlI1gGmurrKwBgxBAtcwhisooY
         MpYw/eQopIxIKfH7tMtmwdHRX/pl9JJKD2fv8sxya0qy+u8b1S8fAq14Y4OWfsSTIlXE
         qULFge26mXkcMMM5/PxqJ+6qgOwgU3hGoJsujyBtqxzi+fZQVlsAqbYP+q8JT303G5BE
         Ly2NFPOSOwXB7bKegAKj3Hombrh+buqJTxu0qHNWZdVayMiK4ON4GRVgeUT+j4SqGDZE
         /mTnTo1g1441hIUgW9ns9iPRKJ6FaeHzBR3nWzILMybXo4wA1qYg2QsXKltDs87Tmpk1
         6iKg==
X-Gm-Message-State: APjAAAWleLRDRUzMozhG1VUb7f0vAlTqQNtbnWzX+P3CMH0GcicA3oZ3
        XHRXXmRXKEVeseouHITzpQlkzQ==
X-Google-Smtp-Source: APXvYqwKFyuwn8czPB//lYXxUKAhousEX+yuI/rd1uOvk1eQoXayPQmUcJGYjHQv1woPvN4u/0mjsA==
X-Received: by 2002:a7b:c451:: with SMTP id l17mr655496wmi.61.1569339241629;
        Tue, 24 Sep 2019 08:34:01 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id d10sm144240wma.42.2019.09.24.08.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 08:34:00 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: clk: axg-audio: add sm1 bindings
Date:   Tue, 24 Sep 2019 17:33:50 +0200
Message-Id: <20190924153356.24103-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924153356.24103-1-jbrunet@baylibre.com>
References: <20190924153356.24103-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the compatible and clock ids of the sm1 audio clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.txt          |  3 ++-
 include/dt-bindings/clock/axg-audio-clkc.h             | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
index b3957d10d241..3a8948c04bc9 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
@@ -7,7 +7,8 @@ devices.
 Required Properties:
 
 - compatible	: should be "amlogic,axg-audio-clkc" for the A113X and A113D,
-		  "amlogic,g12a-audio-clkc" for G12A.
+		  "amlogic,g12a-audio-clkc" for G12A,
+		  "amlogic,sm1-audio-clkc" for S905X3.
 - reg		: physical base address of the clock controller and length of
 		  memory mapped region.
 - clocks	: a list of phandle + clock-specifier pairs for the clocks listed
diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
index 75901c636893..f561f5c5ef8f 100644
--- a/include/dt-bindings/clock/axg-audio-clkc.h
+++ b/include/dt-bindings/clock/axg-audio-clkc.h
@@ -80,5 +80,15 @@
 #define AUD_CLKID_TDM_SCLK_PAD0		160
 #define AUD_CLKID_TDM_SCLK_PAD1		161
 #define AUD_CLKID_TDM_SCLK_PAD2		162
+#define AUD_CLKID_TOP			163
+#define AUD_CLKID_TORAM			164
+#define AUD_CLKID_EQDRC			165
+#define AUD_CLKID_RESAMPLE_B		166
+#define AUD_CLKID_TOVAD			167
+#define AUD_CLKID_LOCKER		168
+#define AUD_CLKID_SPDIFIN_LB		169
+#define AUD_CLKID_FRDDR_D		170
+#define AUD_CLKID_TODDR_D		171
+#define AUD_CLKID_LOOPBACK_B		172
 
 #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */
-- 
2.21.0

