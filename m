Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE5AF99E3
	for <lists+linux-clk@lfdr.de>; Tue, 12 Nov 2019 20:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfKLTij (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 12 Nov 2019 14:38:39 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:35342 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfKLTij (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Nov 2019 14:38:39 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B084C60909; Tue, 12 Nov 2019 19:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573587517;
        bh=+uE/TWS5WT8aFrtGdahchP4ieE7STcp0632ThIZt/sE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CyRC84Ij6CI+3h2p1gWV8AWKBK5uwzuQ19mREjgw/kSoft6QxxwzIORDzf3hnPfHw
         9oJphT/qTLZzhetCVolZin5Z7RbAIcvk5uRKXnXpOGqOAujcXDVcGtTO3+k/Eta5Io
         gUqTT0DDoAnE3fbr3zx36IYlc/hMiBzCPBJ3r+6s=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C694608FF;
        Tue, 12 Nov 2019 19:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573587516;
        bh=+uE/TWS5WT8aFrtGdahchP4ieE7STcp0632ThIZt/sE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gtdGaCkrsVeb0/yAIchbtq3UqXqlLoWhomAjyhn0SLtPIX9KZMK9vxAXS8hvsIpVg
         PgKOqqR7r10cwf8//V4VsFn5ii5WLOsJ727PhQ5w14MpWjqyrUC/YbBB2dpx75q7jx
         RW6cibJs2v9IVf6PeDoYWX6OdDWktD4dBtfdyTdY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0C694608FF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v8 1/4] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
References: <1573254987-10241-1-git-send-email-jhugo@codeaurora.org>
 <1573255036-10302-1-git-send-email-jhugo@codeaurora.org>
 <20191112004417.GA16664@bogus>
 <3e4b1342-7965-2d80-e28d-0cb728037abd@codeaurora.org>
 <CAL_JsqJ3R0Y-KPKaknVT=+RTAskGhqmarb=i9ZDyX5-LzoFOjg@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <fb73ec1e-e5b9-239b-737b-a687f65283d3@codeaurora.org>
Date:   Tue, 12 Nov 2019 12:38:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ3R0Y-KPKaknVT=+RTAskGhqmarb=i9ZDyX5-LzoFOjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/12/2019 11:37 AM, Rob Herring wrote:
> On Tue, Nov 12, 2019 at 10:25 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> On 11/11/2019 5:44 PM, Rob Herring wrote:
>>> On Fri, Nov 08, 2019 at 04:17:16PM -0700, Jeffrey Hugo wrote:
>>>> The global clock controller on MSM8998 can consume a number of external
>>>> clocks.  Document them.
>>>>
>>>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>>> ---
>>>>    .../devicetree/bindings/clock/qcom,gcc.yaml        | 47 +++++++++++++++-------
>>>>    1 file changed, 33 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>>>> index e73a56f..2f3512b 100644
>>>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>>>> @@ -40,20 +40,38 @@ properties:
>>>>           - qcom,gcc-sm8150
>>>>
>>>>      clocks:
>>>> -    minItems: 1
>>>
>>> 1 or 2 clocks are no longer allowed?
>>
>> Correct.
>>
>> The primary reason is that Stephen indicated in previous discussions
>> that if the hardware exists, it should be indicated in DT, regardless if
>> the driver uses it.  In the 7180 and 8150 case, the hardware exists, so
>> these should not be optional.
> 
> Agreed. The commit message should mention this though.

Fair enough, will do.

> 
>>
>> The secondary reason is I found that the schema was broken anyways.  In
>> the way it was written, if you implemented sleep, you could not skip
>> xo_ao, however there is a dts that did exactly that.
> 
> If a dts can be updated in a compatible way, we should do that rather
> than carry inconsistencies into the schema.
> 
>> The third reason was that I couldn't find a way to write valid yaml to
>> preserve the original meaning.  when you have an "items" as a subnode of
>> "oneOf", you no longer have control over the minItems/maxItems, so all 3
>> became required anyways.
> 
> That would be a bug. You're saying something like this doesn't work?:
> 
> oneOf:
>    - minItems: 1
>      maxItems: 3
>      items:
>        - const: a
>        - const: b
>        - const: c

Yes.  That specifically won't work.  "items" would need to have the dash 
preceding it, otherwise it won't compile if you have more than one.  But 
ignoring that, yes, when it compiled, and I saw the output from the 
check failing (after adding verbose mode), min and max for the items 
list would be 3, and the check would fail.

> 
>>   I find it disappointing that the "version" of
>> Yaml used for DT bindings is not documented,
> 
> Not sure which part you mean? json-schema is the vocabulary which has
> a spec. The meta-schema then constrains what the json-schema structure
> should look like. That's still evolving a bit as I try to improve it
> based on mistakes people make. Then there's the intermediate .dt.yaml
> format used internally. That's supposed to stay internal and may go
> away when/if we integrate the validation into dtc.

So, this is probably off-topic, but hopefully you'll find this useful.

I'm probably in the minority, but I really haven't used json-schema nor 
yaml before.  I have experience with other "schema" languages, so I 
figured I could pick what I need from the documentation.

The only documentation I see is writing-schema.md and example-schema.yaml

To me, writing-schema.md is insufficient.  Its better than nothing, so 
I'm still glad it exists, but I don't have any confidence I can really 
write a binding yaml from scratch based on it.  It does a good thing by 
telling you what are important properties of a binding, so based on that 
you can kind of start to understand how existing bindings actually work. 
  Its great in telling you how to run the validation checks (the Running 
checks) section.  The dependencies section is awesome from my 
perspective - most projects seem to assume you just know what their 
dependencies are, and its painful to try to figure them out when you get 
cryptic errors during make.

Where it really fails is that I get no sense of the language.  As a 
minimum a lexigraphic specification that would allow me to write a 
compiler (I've done this before).  Then I would understand what are the 
keywords, and where they are valid.  I wouldn't understand what they 
mean, but at-least I can look at some implemented examples and 
extrapolate from there.

Have you by chance ever looked at the ACPI spec?  Maybe not the best 
example, but its the one that comes to my mind first.  ACPI has ACPI 
Source Language (ASL).  Its an interpreted hardware description language 
that doesn't match yaml, but I think the ACPI spec does a reasonable job 
of describing it.  You have a lexographic definition which seems to be 
really helpful to ACPICA in implementing the intrepreter.  It lists all 
of the valid operators, types, etc.  It provides detailed references of 
each keyword - how they are used, what they do, etc.  Its not the 
greatest at "how to write ASL 101" or "these are common problems that 
people face, and how they can be solved", but atleast with what there 
is, I could read every keyword that seems to be possibly related to what 
I want to do, and hazard a guess if it would work for my problem.

Perhaps that is outside the scope of the writing-schema.md document, 
that is fair.  However, I argue that the document does not provide 
sufficient references.  The document provides a reference to the 
json-schema spec, but the spec is kinda useless (atleast I feel that it 
is).  "minItems" is not defined anywhere in the spec.  What does it 
mean?  How can I use it?  Specific to minItems/maxItems, I'll I've 
gathered about it is from example-schema.yaml which indicates its a way 
to identify mandatory and optional values for a property, but it doesn't 
describe the fact that order matters, and you cannot mix/match things - 
IE it looks like you need atleast min items, and at most max items, but 
even if you have enough items to satisfy min, there cannot be gaps (you 
can't pick items 1, 5, 10 from the list).  I only found that out from 
running the validation checks with trial/error.

There is no reference to the yaml spec, despite the document stating 
that the bindings are written in yaml.

However, having found the yaml spec, its really not much better than the 
json-schema spec, and it doesn't line up because as the document states, 
the bindings are not really written in yaml - its a subset of yaml where 
a ton of the boilerplate "code" is skipped.

What is boilerplate that is skipped?  IMO, if you are not strictly 
adhering to yaml, then you need to clearly document your own derivative 
language so that someone like me whom is being introduced to all of this 
for the first time can start to figure out some of it.  It would be 
helpful to look at other yaml examples, and understand what is 
considered to be boilerplate so I can translate that to a DT binding.

I understand, the majority of the above is complaints and demands which 
is really not fair to you, since you are spending what I presume to be 
your "non-dayjob" time to make the community better.  However, I don't 
really know how to contribute to make the documentation better.  I don't 
understand enough.  As far as this topic is concerned, I'm a dumb monkey 
banging on a keyboard hoping to get close enough to Shakespeare to pass 
mustard by accident, and maybe learn something along the way so that 
next time, I might have an idea of how to do something of what I need.

Hopefully you've made it this far - that ended up being a lot more text 
that I thought it would be.  I really hope this is useful feedback to 
you, but let me know if I am still not clear on something.  I will try 
my best to clarify more.  If you feel like I can contribute somehow, 
just let me know.

> 
>> so after several hours of
>> trial and error, I just gave up since I found this to work (failed cases
>> just gave me an error with no indication of what was wrong, not even a
>> line number).
> 
> Schema failures or dts failures? It is possible to get line numbers
> for either, but that makes validation much slower. In the latter case,
> the line numbers aren't too useful either given they are for the
> .dt.yaml file and not the .dts source file (dtc integration would
> solve that). Adding '-n' to dt-doc-validate or dt-validate will turn
> them on though.

Schema compilation failures.  I don't recall the exact error message, 
but it was something like "no valid schema found, continuing". 
Essentially running "dt_binding_check".  I tried with -v but wasn't 
getting much more in this case.  I didn't try -n.

> 
> Yes, error messages need work. I have some idea how to improve them,
> but haven't had time to implement. Too many binding reviews... You can
> get more detail with '-v' option. It's *way* more verbose, but not
> necessarily more useful.
> 
> Rob
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
