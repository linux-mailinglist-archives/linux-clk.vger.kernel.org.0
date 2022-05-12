Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF655524FB6
	for <lists+linux-clk@lfdr.de>; Thu, 12 May 2022 16:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355014AbiELORL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 12 May 2022 10:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353684AbiELORJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 10:17:09 -0400
X-Greylist: delayed 123 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 12 May 2022 07:17:07 PDT
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57477689BF;
        Thu, 12 May 2022 07:17:06 -0700 (PDT)
Received: from lmontsouris-655-1-15-199.w80-11.abo.wanadoo.fr ([80.11.122.199]:54254 helo=[192.168.1.105])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1np9cm-0004XJ-Ee; Thu, 12 May 2022 16:17:04 +0200
Message-ID: <44568099-52dc-1dba-103d-d56229fd8059@lucaceresoli.net>
Date:   Thu, 12 May 2022 16:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/2] clk: vc5: Add support for IDT/Renesas VersaClock
 5P49V6975
Content-Language: it-IT
To:     Matthias Fend <matthias.fend@emfend.at>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20220511053455.360335-1-matthias.fend@emfend.at>
 <20220511053455.360335-2-matthias.fend@emfend.at>
From:   Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220511053455.360335-2-matthias.fend@emfend.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Matthias,

thank you for your patch!

On 11/05/22 07:34, Matthias Fend wrote:
> Update IDT VersaClock 5 driver to support 5P49V6975. The 5P49V6975 is a
> member of the VersaClock 6E family and supports four fractional dividers
> (FODs), five clock outputs and an internal oscillator.
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
