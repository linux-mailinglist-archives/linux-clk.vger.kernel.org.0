Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8123263E8
	for <lists+linux-clk@lfdr.de>; Fri, 26 Feb 2021 15:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbhBZOQE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 26 Feb 2021 09:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhBZOPn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Feb 2021 09:15:43 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7710CC06178A
        for <linux-clk@vger.kernel.org>; Fri, 26 Feb 2021 06:14:17 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id mm21so14775805ejb.12
        for <linux-clk@vger.kernel.org>; Fri, 26 Feb 2021 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LUu93rGA1cHh0fyqCMn68WZCCrDnAzCezR4V6cd4F40=;
        b=af+gg5BZ4ZAapi4Qfsk9u7x2RNMSU0TV+BRUD5V4dMNR83ZAHBB/2nGj6S0A4j2K+0
         s7og7GkPbfioM1qaDCoKg0W8is2b0pJDWy5qXZsU8B/jbzYD3urYQL4odSEOMEVVH7Rc
         qeIxewcBW6HuJ75ZEUNeRzqU2cMv9wYlDkTkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LUu93rGA1cHh0fyqCMn68WZCCrDnAzCezR4V6cd4F40=;
        b=XMBsjfheecFU8QIcwN650oxUvVgeZJKvelG+Rikvthim22uXB8J2fUyiHJ9gTgFcrS
         AFhZ/veQnwKyMdjDRNx8A1ipkuVL5hI5hBGTDL5covCFm448Cr6PwCwprx8M8VzyoLoO
         tTPf4DCAs3llKBcVhqyMq4LLPhe2s+54vO0OCPld49ukSUlS+ALOQ/cHn9i7//sotNy1
         yPF8AAYZrTumpbv1Z9ftu0cj2jJdCmsZ5oHottKuY3rmxZDWq6oFTXZ+eYcg8HPKREcp
         olRPSDiEXdzwatnApjedxeM4s4LNHA6jf5ydP/ldRHImtUw5L5xPKgxdJKI3XgvZDXCN
         6DHg==
X-Gm-Message-State: AOAM5324lnyraxCeTCPGUrL/5APdk7gw+JzcVJAguYTwC8HB//m+iHep
        TAnc8F5mGmJrycZAVPylaD/Xig==
X-Google-Smtp-Source: ABdhPJzabGx6JCofY0z/Cp5d89cR8H1+SNGOEkjVaC9c8nTuduiSccUfn/vsu5zSdaHECDAwJmIUCg==
X-Received: by 2002:a17:906:8147:: with SMTP id z7mr3451969ejw.436.1614348856083;
        Fri, 26 Feb 2021 06:14:16 -0800 (PST)
Received: from prevas-ravi.prevas.se ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id g3sm5316838ejz.91.2021.02.26.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:14:15 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 1/2] dt-bindings: misc: add binding for generic ripple counter
Date:   Fri, 26 Feb 2021 15:14:10 +0100
Message-Id: <20210226141411.2517368-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

While a ripple counter can not usually be interfaced with (directly)
from software, it may still be a crucial component in a board
layout. To prevent its input clock from being disabled by the clock
core because it apparently has no consumer, one needs to be able to
represent that consumer in DT.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 Documentation/devicetree/bindings/misc/ripple-ctr.txt | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/ripple-ctr.txt

diff --git a/Documentation/devicetree/bindings/misc/ripple-ctr.txt b/Documentation/devicetree/bindings/misc/ripple-ctr.txt
new file mode 100644
index 000000000000..1497d3a237a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/ripple-ctr.txt
@@ -0,0 +1,8 @@
+Generic ripple counter
+
+A ripple counter is a simple component that can for example be used to
+delay propagation of a signal.
+
+Required properties:
+- compatible: Must be "linux,ripple-ctr".
+- clocks: Input clock specifier. Refer to common clock bindings.
-- 
2.29.2

