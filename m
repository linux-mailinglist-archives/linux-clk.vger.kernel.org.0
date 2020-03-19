Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC79418C034
	for <lists+linux-clk@lfdr.de>; Thu, 19 Mar 2020 20:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgCSTSe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 19 Mar 2020 15:18:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:51758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726795AbgCSTSd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 19 Mar 2020 15:18:33 -0400
Received: from [192.168.1.31] (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CEF3B2072C;
        Thu, 19 Mar 2020 19:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584645512;
        bh=JRu7JfgdQZV3f+RPv3NMXK6cBbLataRAblisTCkWaGM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XazgECJ4rAip/vItlC+fxOY+kBMD2uGj8jh2C2uikXQfRoX3WmzFcZGXNrxn1TO9G
         3DM0U4aH1wxi3utIkIwfAf1Si0J5vSuJck6ZyQ8dOevSQVJYfD+w9v8/BJWf4T2rUZ
         ZWM08yCNLPt45jNKa3v5mr+8uHs3YyNvMHaEfgF0=
Subject: Re: [PATCHv3 4/5] dt-bindings: documentation: add clock bindings
 information for Agilex
To:     Rob Herring <robh@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>
References: <20200317161022.11181-1-dinguyen@kernel.org>
 <20200317161022.11181-5-dinguyen@kernel.org> <20200318224042.GA32101@bogus>
 <30180323-3c74-d04a-b715-3b1f655d6a81@kernel.org>
 <CAL_JsqJ-c5tvWUMGKu4scy85cGdYHzPxR7NTzEd9V5RQHveW0g@mail.gmail.com>
From:   Dinh Nguyen <dinguyen@kernel.org>
Autocrypt: addr=dinguyen@kernel.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ac73efae-e4c7-f151-2b16-0545b139515f@kernel.org>
Date:   Thu, 19 Mar 2020 14:18:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ-c5tvWUMGKu4scy85cGdYHzPxR7NTzEd9V5RQHveW0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob,

On 3/19/20 11:56 AM, Rob Herring wrote:
> On Thu, Mar 19, 2020 at 10:16 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
>>
>> Hi Rob,
>>
>> On 3/18/20 5:40 PM, Rob Herring wrote:
>>> On Tue, 17 Mar 2020 11:10:21 -0500, Dinh Nguyen wrote:
>>>> Document the Agilex clock bindings, and add the clock header file. The
>>>> clock header is an enumeration of all the different clocks on the Agilex
>>>> platform.
>>>>
>>>> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
>>>> ---
>>>> v3: address comments from Stephen Boyd
>>>>     fix build error(tab removed in line 37)
>>>>     renamed to intel,agilex.yaml
>>>> v2: convert original document to YAML
>>>> ---
>>>>  .../bindings/clock/intel,agilex.yaml          | 36 ++++++++++
>>>>  include/dt-bindings/clock/agilex-clock.h      | 70 +++++++++++++++++++
>>>>  2 files changed, 106 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/clock/intel,agilex.yaml
>>>>  create mode 100644 include/dt-bindings/clock/agilex-clock.h
>>>>
>>>
>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>
>>> Error: Documentation/devicetree/bindings/clock/intel,agilex.example.dts:17.3-4 syntax error
>>> FATAL ERROR: Unable to parse input tree
>>> scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/clock/intel,agilex.example.dt.yaml' failed
>>> make[1]: *** [Documentation/devicetree/bindings/clock/intel,agilex.example.dt.yaml] Error 1
>>> Makefile:1262: recipe for target 'dt_binding_check' failed
>>> make: *** [dt_binding_check] Error 2
>>>
>>> See https://patchwork.ozlabs.org/patch/1256630
>>> Please check and re-submit.
>>>
>>
>> I want to be able check these errors locally before sending the next
>> version. But I keep getting various errors when I try to "make
>> dt_binding_check":
>>
>> Traceback (most recent call last):
>>   File "/bin/dt-doc-validate", line 15, in <module>
>>     import ruamel.yaml
>> ImportError: No module named 'ruamel'
>> Documentation/devicetree/bindings/Makefile:12: recipe for target
>> 'Documentation/devicetree/bindings/arm/l2c2x0.example.dts' failed
>>
>>
>> Do you have a pointer on how to run the dt_binding_check?
> 
> Documentation/devicetree/writing-schema.rst
> 
> ruamel should get installed automatically when you run pip3. If you
> just cloned dt-schema, then you still need to run pip on the project
> directory. That's documented in the project readme.
> 

Thanks alot for the pointers. Fixed it.

Dinh
