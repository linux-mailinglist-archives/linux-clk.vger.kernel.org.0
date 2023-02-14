Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD416961A2
	for <lists+linux-clk@lfdr.de>; Tue, 14 Feb 2023 12:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbjBNLBm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 14 Feb 2023 06:01:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbjBNLBj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Feb 2023 06:01:39 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6679222C6
        for <linux-clk@vger.kernel.org>; Tue, 14 Feb 2023 03:01:35 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id sa10so39012780ejc.9
        for <linux-clk@vger.kernel.org>; Tue, 14 Feb 2023 03:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e62fN1MhbeUOHVVjTCBAKKz2knPWJHqUGgFc+Eioq+E=;
        b=OU4sNRRszHNGyV2q8ipjYsmsp71SJ7C3TNg1i4DJ3xKvrhHs86jteng5yCu0khNskx
         UrKPLflutrNJcy0O9CeaIHNjTq+OKdxaaGQ2ElsAVeAeC6UXw+L/BL6WIIpdNOcVHrPK
         aJ1FVxP+8wS9a9XpjEqis+T4fhagovggT0VQb7nd9U/myfPNDnOHWwIGcLPJKiqy1LO1
         ThTTMin58QLto6+WgAUcd8pxGZJ+FHQNIZiJxHN411GzHlnT23YFXbwpvd7RfPNJb7pN
         Rj9P6H7bXnqbIIe1FnpPl9ars2RKbu43JucgypL2CemeDjvstj43NmuRvIo8QkqTKVs3
         J37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e62fN1MhbeUOHVVjTCBAKKz2knPWJHqUGgFc+Eioq+E=;
        b=SPC3vxz+GSVM2hUG8pW4NMwgtfK6oeMS2HYzmEOK/gM4WoYY39RDZfCS8folRtR61y
         iF5nGY7MFi9mXIrjlQyiWfknD9BXD/8kd+hU0EdVwSL+HR9LDenrexT2+phKiOxI5MH9
         oSojXPEcufOSXB72iyUv8jFgXd2yrdE/1UJ7oVVUje29HEMS/kzzWsgheKflLB2sbT69
         G7ciAwR/DQ6EfWYUei2iKJJJFhkYYwWmX2DjjdhOkFVhKbXPZvRkXj/hNxk2NS3QoiFj
         8e1+EmmpL/ANf29bAgLpGrkzotLYAvRcaj8hqHOLPGcnuewd6uD5tishnRZZt7+vVLqr
         JyiA==
X-Gm-Message-State: AO0yUKWoA2wUFgB2ckigvbXRJVevpyUN9C45ofuA8ccHfmoSE/feJIXo
        oD+4ehRuwOJiSVNZao+DRLTohw==
X-Google-Smtp-Source: AK7set8UN3gUOYP807cpBkrxkjxHgNA/mxAjfjdMGbkgNnpuMPKd/w19fzBVALxbauqhlG3dRexbwg==
X-Received: by 2002:a17:906:1747:b0:88e:e6ee:feab with SMTP id d7-20020a170906174700b0088ee6eefeabmr2249288eje.62.1676372494443;
        Tue, 14 Feb 2023 03:01:34 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id i21-20020a170906115500b008711cab8875sm7959596eja.216.2023.02.14.03.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 03:01:34 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/2] Add pm_runtime support to SM6350 camcc
Date:   Tue, 14 Feb 2023 12:01:31 +0100
Message-Id: <20230213-sm6350-camcc-runtime_pm-v3-0-d35e0d833cc4@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtq62MC/42Oyw6DIBBFf8Ww7hgeitpV/6NpGkCoLEQDan3Ef
 y+66q5dnju5586GgvZWB3RNNuT1ZIPtXAR2SZBqhHtpsHVkRDFlmBIGoeUsx6BEqxT40Q221c+
 +Bc4qWeSK1ZkkKLalCBqkF041R9/0GfCUwtv2x7X32tj53L0/Ijc2DJ1fzjcmcqS/FycCGApOj
 OKVKUSJbytzw5jOy4oO50T/9NDo4VjkuJCGaV5+e/Z9/wDjyeJRJAEAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As pointed out during patch review, we should make sure that we turn on
the CX power domain when camcc is in use, and also disable it (or remove
our vote on it) when camcc is not in use.

For this add pm_runtime support to the driver and stick the power-domain
in the devicetree.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Remove extra error print for qcom_cc_really_probe since driver core
  already prints the error anyways
- Fix From: and Sign-offs email address confusion, sorry about that...
- Link to v2: https://lore.kernel.org/r/20230213-sm6350-camcc-runtime_pm-v2-0-60a507bf3e68@z3ntu.xyz

Changes in v2:
- no change resend since I messed up To/CC in the initial submission
- Link to v1: https://lore.kernel.org/r/20230213-sm6350-camcc-runtime_pm-v1-0-761fc69f7a80@z3ntu.xyz

---
Luca Weiss (2):
      clk: qcom: camcc-sm6350: add pm_runtime support
      arm64: dts: qcom: sm6350: add power domain to camcc

 arch/arm64/boot/dts/qcom/sm6350.dtsi |  2 ++
 drivers/clk/qcom/camcc-sm6350.c      | 25 ++++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)
---
base-commit: 09e41676e35ab06e4bce8870ea3bf1f191c3cb90
change-id: 20230213-sm6350-camcc-runtime_pm-639b75c3d4b1

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

