Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7BB1B79D2
	for <lists+linux-clk@lfdr.de>; Fri, 24 Apr 2020 17:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgDXPf3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 24 Apr 2020 11:35:29 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:59751 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726849AbgDXPf2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Apr 2020 11:35:28 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 4906C78A;
        Fri, 24 Apr 2020 11:35:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=Qm04qMuBv7fTr
        3XQL3pQXZGC/epnrC5zo/RIT1dLqig=; b=XWPBUnloTpw693cNK86jats0UjZsU
        LYYzIOWDLDcbxljiWdawcNkq7cD2P/Zxw8uHRGlU4BY+92zF8EriCXAwRjC250/i
        Q/2eTVQ/HTnsxF1ssYTyYFViAXI3iD04XT6+rrO7DF6NuRYqYqf0Fr4Dzpm6MZPD
        ycxecx+ykib6FCBi3esoLSzAFsAUHrsOfoKE1k4rzwQAMLK3eKK0+3wk20pa+sr+
        auX1+Ei91tdcu9eCeAsvVajjTdHTyKxHryR7OWzSTJGy77EJFIy/F5FudWNXKmXe
        +QRl0SIEdGaez3xJaxwc48AlmAddOZftk/jNnPlnhUj5KWVwLAlCKEYLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=Qm04qMuBv7fTr3XQL3pQXZGC/epnrC5zo/RIT1dLqig=; b=uV6TaWdn
        FOEFeAtYf7zwrFEEppmSrP/Cg4G7SQqf1Y9lXsUlmFxNmmZC0s/54ZQciU+nVXIK
        HDNzGdnTxF/NWUOnVvoMwpyfTP98HTHJ/tDAdgSuNf2VmYhMQuebhxMysuby2uOM
        m7eSZHoj2uVcJuv/yc+PdyhzwdEeH7wXglLByi2UCQ3wiFx7h5Pzs1pqUN5/tb5E
        YOYYIDVYOuTjn9LnS9CJPjOpdNuGxS4WSYomsPE/CIszQwynZU4tBvSidn4ux/XC
        D6ICsTxk3YhxCssDjG5yp3EEcCqrcDq5pLI58ssQUVfvzZYxOaKUiHQR3ObJdZAh
        RmNX/xFwD/DW8w==
X-ME-Sender: <xms:PgejXiOUue0ABFDmxlj4Dcnug7_XUMg7mPZqTn46PxLLzGJYEuUHBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PgejXtuuxHtho2QIg_Y9ZrYVgvAZGVqvbiPhrGF-YUWa-6e4CkFJgA>
    <xmx:PgejXo3_3EsiNmsdgnraJlS2xDsgt3V-5khm09Gk8pXR6R3juYKkwg>
    <xmx:PgejXrXXEYqDWPfrWwEeugSke6yeZWvA6W8V5fg2IW0ypVf0Iexw8A>
    <xmx:PgejXi7U-ajfaRtJoaZS_RedX5MulrwEM5fBhqk4zeStc0V2v5YNc5sxdg4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 84E4C3065CDA;
        Fri, 24 Apr 2020 11:35:26 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>
Cc:     dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 03/91] dt-bindings: clock: Add a binding for the RPi Firmware clocks
Date:   Fri, 24 Apr 2020 17:33:44 +0200
Message-Id: <69e869b0a79ea17f2cdb79df986409963672495a.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The firmware running on the RPi VideoCore can be used to discover and
change the various clocks running in the BCM2711. Since devices will
need to use them through the DT, let's add a pretty simple binding.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index cec540c052b6..b48ed875eb8e 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -22,6 +22,25 @@ properties:
       Phandle to the firmware device's Mailbox.
       (See: ../mailbox/mailbox.txt for more information)
 
+  clocks:
+    type: object
+
+    properties:
+      compatible:
+        const: raspberrypi,firmware-clocks
+
+      "#clock-cells":
+        const: 1
+        description: >
+          The argument is the ID of the clocks contained by the
+          firmware messages.
+
+    required:
+      - compatible
+      - "#clock-cells"
+
+    additionalProperties: false
+
 required:
   - compatible
   - mboxes
@@ -31,5 +50,10 @@ examples:
     firmware {
         compatible = "raspberrypi,bcm2835-firmware", "simple-bus";
         mboxes = <&mailbox>;
+
+        firmware_clocks: clocks {
+            compatible = "raspberrypi,firmware-clocks";
+            #clock-cells = <1>;
+        };
     };
 ...
-- 
git-series 0.9.1
