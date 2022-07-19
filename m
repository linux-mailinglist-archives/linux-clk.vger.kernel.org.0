Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED6057A8FB
	for <lists+linux-clk@lfdr.de>; Tue, 19 Jul 2022 23:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbiGSVaF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 19 Jul 2022 17:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234448AbiGSVaE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jul 2022 17:30:04 -0400
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB361F6
        for <linux-clk@vger.kernel.org>; Tue, 19 Jul 2022 14:30:02 -0700 (PDT)
Received: from [77.244.183.192] (port=64334 helo=[192.168.178.42])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <luca@lucaceresoli.net>)
        id 1oDun0-00081k-PP;
        Tue, 19 Jul 2022 23:29:58 +0200
Message-ID: <f7d961e9-9674-63d3-38aa-a4b0b05f71bf@lucaceresoli.net>
Date:   Tue, 19 Jul 2022 23:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] clk: vc5: Check IO access results
Content-Language: it-IT
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
References: <20220719094637.844946-1-lars@metafoo.de>
From:   Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220719094637.844946-1-lars@metafoo.de>
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
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Lars-Peter,

On 19/07/22 11:46, Lars-Peter Clausen wrote:
> The devices of the versaclk clock generator family use an I2C control bus.
> IO access on an I2C bus can fail for various reasons.
> 
> The driver currently ignores the return value of most IO operations. This
> results in silent failure. To avoid this check the return value and in case
> of an error abort the operation and propagate the error code to the caller.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Thank you!

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
