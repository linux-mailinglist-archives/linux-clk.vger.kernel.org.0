Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A4B497369
	for <lists+linux-clk@lfdr.de>; Sun, 23 Jan 2022 18:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239130AbiAWRJq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 23 Jan 2022 12:09:46 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59150
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236887AbiAWRJo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Jan 2022 12:09:44 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3A01F3F1BE
        for <linux-clk@vger.kernel.org>; Sun, 23 Jan 2022 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642957783;
        bh=bAB2fSeFXr1iDyEioRuZfgxzqfQwxPJErMMQv+8KHJM=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=ao+WLHt+s0YLzobdySvBBk4AxnzPF336fUg+UgDojEs+rO6HRNXWGUHv3Az5F3b3f
         JUByNSCDLVyRb2Yz8pYGaQEUs861WTTayzkAWVq0wmKIq8YAcVIMd40PSPVGpqptjH
         A45ChSQZUoKT6ZSUFECHLu5xfIzCxysvlS2/0lTeNzQmajSraT8o2PW5edBK+boQfU
         e7V4DU3EQ669K3DhCVQ8r0NbOrmwo7neluPXTNHOrsHSbV+8ahwLNjS4kIEPfcLzj1
         2A1ECep0OvMuLiAZ/SKLkB71wZhPI7KTWmp2PToip8A4hW5Qaecl/kvajbiIUzScZI
         JptZ77xnokWfg==
Received: by mail-ed1-f72.google.com with SMTP id w23-20020a50d797000000b00406d33c039dso4089978edi.11
        for <linux-clk@vger.kernel.org>; Sun, 23 Jan 2022 09:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bAB2fSeFXr1iDyEioRuZfgxzqfQwxPJErMMQv+8KHJM=;
        b=HyYhXw5dpB/cCybeQolk3h4WmLb1veQ8O2rvMNhRasy28dp2EJtiHoFyQht0GNS80m
         y8Nqj/ULmSmeYNZxVH/rmCtB3+z0hmpoyHCUTehVJ+reXU+CTqm3BsTLQAu/ItfmphNf
         sQUMPlq6bifkLFFB6pbotdjEzq6SFt/wCTLdVxE7D52ms2OLcpNXg5MEci9yQ83OaDDT
         0ESxGorA4CHvpMCAFxSPFxbhq1dDUIFhdayWKMqwRWdFKIGFGLbE5WDNKI08ecQDL5pJ
         bODnYvE4j0klY06LnOGy5L4SOk9vn78wW+uhhVEsXVRiGlYqGerNrURv8B5k09kT30Bk
         mm8w==
X-Gm-Message-State: AOAM533aFNBxA6oApkPEisTka2RQEQu9ikbfpggMsKGsYnjBzJYuPfq6
        p5ynoZti3bRo7ahyiBQVkgr6dy5jLSOU8I7a3uUvA9Gqe9O56OHv/Hg5zorZjxHEMrkBaJD1VVB
        pL2IQ++Kor5hoagCp+otOTJSTjuT4L+5zwv9rfQ==
X-Received: by 2002:aa7:db82:: with SMTP id u2mr12000657edt.49.1642957782255;
        Sun, 23 Jan 2022 09:09:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJym4mMqq/tFhaDkWmk/qI/ha0u380SHusDsVSKwDK+WyJY+R2Os4Cbut38vPBr5J6Sm+KuHRg==
X-Received: by 2002:aa7:db82:: with SMTP id u2mr12000636edt.49.1642957782086;
        Sun, 23 Jan 2022 09:09:42 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id o11sm5268176edh.75.2022.01.23.09.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 09:09:41 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/8] arm64: dts: exynos: add necessary clock inputs in Exynos7
Date:   Sun, 23 Jan 2022 18:09:31 +0100
Message-Id: <164295777264.25838.3443202173947810601.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220102115356.75796-1-krzysztof.kozlowski@canonical.com>
References: <20220102115356.75796-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 2 Jan 2022 12:53:49 +0100, Krzysztof Kozlowski wrote:
> Exynos7 devicetree bindings require more input clocks for TOP0 and
> PERIC1 clock controllers, than already provided.  Existing DTS was not
> matching the bindings, so let's update the DTS, even though the error
> could be in the bindings.
> 
> 

Applied, thanks!

[1/8] arm64: dts: exynos: add necessary clock inputs in Exynos7
      commit: 372d171cd9b472cff7852211195f211150bc27d2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
