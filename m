Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E737F4ADA6D
	for <lists+linux-clk@lfdr.de>; Tue,  8 Feb 2022 14:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347519AbiBHNyA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Feb 2022 08:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233604AbiBHNyA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 08:54:00 -0500
X-Greylist: delayed 405 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 05:53:59 PST
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 14BCCC03FECE
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 05:53:59 -0800 (PST)
Received: from [192.168.178.106] (p57bc97a7.dip0.t-ipconnect.de [87.188.151.167])
        by mail.bugwerft.de (Postfix) with ESMTPSA id A8513501690;
        Tue,  8 Feb 2022 13:46:42 +0000 (UTC)
Message-ID: <4a4fce1b-f9a8-27a4-377a-f569277e0f28@zonque.org>
Date:   Tue, 8 Feb 2022 14:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RESEND v4 1/9] dt-bindings: clock: convert cs2000-cp
 bindings to yaml
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org, kuninori.morimoto.gx@renesas.com
References: <20220125093336.226787-1-daniel@zonque.org>
 <20220125093336.226787-2-daniel@zonque.org>
 <20220125222905.14377C340E0@smtp.kernel.org>
From:   Daniel Mack <daniel@zonque.org>
In-Reply-To: <20220125222905.14377C340E0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On 1/25/22 23:29, Stephen Boyd wrote:
> Quoting Daniel Mack (2022-01-25 01:33:28)
>> The original author of the file was added as maintainer.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
> 
> Applied to clk-next

Thanks for applying!

I don't see these patches in your tree yet though, probably just a
missing push?


Best regards,
Daniel
