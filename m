Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB7073464B
	for <lists+linux-clk@lfdr.de>; Sun, 18 Jun 2023 15:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjFRNXZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 18 Jun 2023 09:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjFRNXY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Jun 2023 09:23:24 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E2F1BF;
        Sun, 18 Jun 2023 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687094594; x=1718630594;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LfyquutmidP2HJP0MsNOnHSnrpomrzgZpCbNNI6rJfE=;
  b=keViApPzZAEQ+PgFh1Ey9q2vrs4BT+Tm0XKeNqr2eKJRKtkFIorq5IZT
   Zb/ALF/YkBGu1BYixywGydhaFPC8NLbTz36GY0svfWF/F+ymVnn2raVLX
   uMXg45qq5N+XHtJ3vMrHES2To0bBWtsikQUr9X7ApSwzI4nlYkrMcpArx
   t5Cz4REuGISryvO1+p/0mgVqGpA214xGwaKSeIQppnXOucR9sk+QKCpBA
   8zMxGLgsKUSdfu4scYOjyeJGmylWG7usxCKNg3EcSBJvPSXRqkIzndL0h
   vRsAIhpAJiPXeKJUEHypofv8VIv/xZjlRO8pM5+RXf47p72hpcd8faVzd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="356967043"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="356967043"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 06:23:14 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="747146765"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="747146765"
Received: from unknown (HELO localhost.localdomain) ([10.226.216.116])
  by orsmga001.jf.intel.com with ESMTP; 18 Jun 2023 06:23:09 -0700
From:   niravkumar.l.rabara@intel.com
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wen Ping <wen.ping.teh@intel.com>,
        Richard Cochran <richardcochran@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org,
        Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
Subject: [PATCH 1/4] dt-bindings: intel: Add Intel Agilex5 compatible
Date:   Sun, 18 Jun 2023 21:22:32 +0800
Message-Id: <20230618132235.728641-2-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230618132235.728641-1-niravkumar.l.rabara@intel.com>
References: <20230618132235.728641-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

Add new compatible for Intel Agilex5 based boards.

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---
 Documentation/devicetree/bindings/arm/intel,socfpga.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/intel,socfpga.yaml b/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
index 4b4dcf551eb6..28849c720314 100644
--- a/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
+++ b/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
@@ -20,6 +20,7 @@ properties:
               - intel,n5x-socdk
               - intel,socfpga-agilex-n6000
               - intel,socfpga-agilex-socdk
+              - intel,socfpga-agilex5-socdk
           - const: intel,socfpga-agilex
 
 additionalProperties: true
-- 
2.25.1

