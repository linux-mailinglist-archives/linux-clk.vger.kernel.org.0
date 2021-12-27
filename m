Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B917E47FD9A
	for <lists+linux-clk@lfdr.de>; Mon, 27 Dec 2021 14:36:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236988AbhL0Ngc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 27 Dec 2021 08:36:32 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39758
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237031AbhL0NgV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 08:36:21 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BF0A33F32C
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640612176;
        bh=JFavKQ4EpkcOZ7wQmRTeTvx/mZGmly/qZElot/QHLH0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Z9U5rdJcOtHe9DMjh0otK6nZ77vPGZNAQQ15NecpofHYh+qJ796act2dZv2mc9Qbx
         iVCBrfHGutb8zATIMRwlxEVW9gAprFZ8GbsGjOqekF8MJnjJb0iuOlbjBctl622wUq
         u18x/LVEJ0KADUl7eY9n4v3IbzEwQpkTRUgFhaNVZHyyodIGPuYySo9t+eGRtYI9Vm
         bR4ALx1VygOi+jFmeZNBkGEiENovx74yetlmfZxvczSXH5vRLlbj3C0IC+PNIWgNGu
         mCD/0z/H59fmXfy8MNLQKHM9eTo4DjXPHvrZ2iac8rrMckGcyoBh35nWVlNMV7r6ST
         g59QiQL5Brl5w==
Received: by mail-lj1-f200.google.com with SMTP id s19-20020a2eb8d3000000b0022d8722e7b5so3971781ljp.23
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 05:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JFavKQ4EpkcOZ7wQmRTeTvx/mZGmly/qZElot/QHLH0=;
        b=hkKxSWeG34ac+e7GNsNnwp0Us6Lr2lf0Y4Z07Q98KRwnryEPC+ehFV8qS6RcQn1J6l
         bjSVwq6za0wbl5DOefq35S+MaA996uTqZ5aT5WV1JtB1MD5GHCPPG+a/cC18U+bKIAfW
         9eZE5WSsW3/Mj1P9rYgkvAoYXgxpvQ3oc7ON6CyXwoeBoCkbKfQFAyjqloIOAoyFgg3b
         YMhmblzVya+nSJ81oCCs2UwNwDZ9jAjwid/NDKs/BTn2WX4fqK4m0pEeAFHvGMlx0nD1
         dz3gjPim9CGbwsE810hZcNvNuQTIotHCSJWFVmpiUPgCbX3ZBE38gNQRLNlggDP5cF1e
         ln0g==
X-Gm-Message-State: AOAM532dhgTtR0wOKHcpu78hvkByb/9GVR9WhBw5l1rZAMIUpeSG7tf6
        6Jes/3a6iueazTzgSbm9xQTYVSrDp+k21rB8hEy1H4D2MWsR63iqYIKXq5PkK4F+Z4EG29/2O7F
        qfv9GH1Xwxy5C3rKS9vHakdOReVXGA8QZ5gLE0w==
X-Received: by 2002:a05:651c:612:: with SMTP id k18mr14341420lje.383.1640612176049;
        Mon, 27 Dec 2021 05:36:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyigWSTBhHMTJw9c+BMRCCqABSOCIw31rtBFtt3dBgwEbcNUZTxOPbnbqo+v1WaY9WCE71FlQ==
X-Received: by 2002:a05:651c:612:: with SMTP id k18mr14341415lje.383.1640612175896;
        Mon, 27 Dec 2021 05:36:15 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id g18sm800107ljj.124.2021.12.27.05.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 05:36:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 18/19] arm64: dts: agilex: add board compatible for N5X DK
Date:   Mon, 27 Dec 2021 14:35:57 +0100
Message-Id: <20211227133558.135185-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
References: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Intel SoCFPGA N5X SoC Development Kit is a board with
Agilex, so it needs its own compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
index f3c1310dae0a..5609d8df6729 100644
--- a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
@@ -6,6 +6,7 @@
 
 / {
 	model = "eASIC N5X SoCDK";
+	compatible = "intel,n5x-socdk", "intel,socfpga-agilex";
 
 	aliases {
 		serial0 = &uart0;
-- 
2.32.0

